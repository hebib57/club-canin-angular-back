const express = require("express");
const cors = require("cors");
const mysql = require("mysql2");
const bcrypt = require("bcrypt");
const jwtUtils = require("jsonwebtoken");
const interceptor = require("./middleware/jwt-interceptor");

const app = express();

// Configuration de la base de données
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "club-canin2",
});

// Connexion à la base de données
connection.connect((err) => {
  if (err) {
    console.error("Erreur de connexion à la base de données :", err);
    return;
  }
  console.log("Connecté à la base de données MySQL");
});

app.use(cors());

app.use(express.json()); // permet d'envoyer et recevoir du json(via les en-têtes content-type et accept-content)

//app.use()

// "/" = définit la route
app.get("/", (requete, resultat) => {
  resultat.send("<h1>C'est une API il y a rien à voir ici</h1>");
});

app.get("/chien/list", (requete, resultat) => {
  connection.query(
    "SELECT chien.*, race.nom_race FROM chien JOIN race ON chien.id_race = race.id_race",
    (err, chien) => {
      //en cas d'erreur sql ou interuption de connexion avec la BDD
      if (err) {
        console.error(err);
        return resultat.sendStatus(500);
      }

      return resultat.json(chien);
    }
  );
});

app.get("/chien/:id", (requete, resultat) => {
  connection.query(
    "SELECT * FROM chien WHERE id_dog = ?",
    [requete.params.id],
    (err, chien) => {
      //en cas d'erreur sql ou interuption de connexion avec la BDD
      if (err) {
        console.error(err);
        return resultat.sendStatus(500);
      }

      //si l'id du chien est inconnu
      if (chien.length == 0) {
        return resultat.sendStatus(404);
      }

      return resultat.json(chien[0]);
    }
  );
});

app.put("/chien/:id", interceptor, (requete, resultat) => {
  const chien = requete.body;
  chien.id = requete.params.id;

  if (requete.user.role != "coach" && requete.user.role != "admin") {
    return resultat.sendStatus(403);
  }

  if (
    chien.nom_dog == null ||
    chien.nom_dog == "" ||
    chien.nom_dog.length > 20 ||
    chien.sexe_dog.length > 50
  ) {
    return resultat.sendStatus(400); //bad request
  }

  //verification si le nom du produit existe déjà
  connection.query(
    "SELECT * FROM chien WHERE nom_dog = ? AND id_dog != ?",
    [chien.nom_dog, chien.id],
    (err, chiens) => {
      if (chiens.length > 0) {
        return resultat.sendStatus(409); //conflict
      }

      connection.query(
        "UPDATE chien SET nom_dog = ?, sexe_dog = ? WHERE id_dog = ?",
        [chien.nom_dog, chien.sexe_dog, chien.id],
        (err, lignes) => {
          if (err) {
            console.error(err);
            return resultat.sendStatus(500); //internal server
          }
          return resultat.status(200).json(chien); //OK
        }
      );
    }
  );
});

app.post("/chien", interceptor, (requete, resultat) => {
  const chien = requete.body;

  if (requete.user.role != "admin" && requete.user.role != "coach") {
    return resultat.sendStatus(403);
  }

  //validation
  if (
    chien.nom_dog == null ||
    chien.nom_dog == "" ||
    chien.nom_dog.length > 20 ||
    chien.sexe_dog.length > 50
  ) {
    return resultat.sendStatus(400); //bad request
  }

  //verification si le nom du produit existe déjà
  connection.query(
    "SELECT * FROM chien WHERE nom_dog = ?",
    [chien.nom_dog],
    (err, chiens) => {
      if (chiens.length > 0) {
        return resultat.sendStatus(409); //conflict
      }

      connection.query(
        "INSERT INTO chien (nom_dog, sexe_dog, id_utilisateur) VALUES (?, ?, ?)",
        [chien.nom_dog, chien.sexe_dog, requete.user.id],
        (err, lignes) => {
          if (err) {
            console.error(err);
            return resultat.sendStatus(500); //internal server
          }
          return resultat.status(201).json(chien); //created
        }
      );
    }
  );
});

app.delete("/chien/:id", interceptor, (requete, resultat) => {
  //on recup le chien
  connection.query(
    "SELECT * FROM chien WHERE id_dog = ?",
    [requete.params.id],
    (erreur, lignes) => {
      //si il y a une erreur
      if (erreur) {
        console.error(erreur);
        return resultat.sendStatus(500); //internal servor
      }
      //si l'id du chien est inconnu
      if (lignes.length == 0) {
        return resultat.sendStatus(404);
      }
      //on verifie si l'utilisateur connecté est le propriétaire
      const estPropriétaire =
        requete.user.role == "coach" || requete.user.role == "admin";
      // requete.user.id == lignes[0].id_utilisateur;

      if (!estPropriétaire) {
        return resultat.sendStatus(403);
      }
      // on supprime le produit
      connection.query(
        "DELETE FROM chien WHERE id_dog = ?",
        [requete.params.id],
        (erreur, lignes) => {
          //si il y a une erreur
          if (erreur) {
            console.error(erreur);
            return resultat.sendStatus(500); //internal servor
          }
          //204 = no content = tout s'est bien passé, mais il n'y a rien dans le corps de la réponse
          return resultat.sendStatus(204);
        }
      );
    }
  );
});

app.get("/cours/list", (requete, resultat) => {
  connection.query("SELECT * FROM cours", (err, cours) => {
    //en cas d'erreur sql ou interuption de connexion avec la BDD
    if (err) {
      console.error(err);
      return resultat.sendStatus(500);
    }

    return resultat.json(cours);
  });
});

app.get("/cours/:id", (requete, resultat) => {
  connection.query(
    "SELECT * FROM cours WHERE id_cours = ?",
    [requete.params.id],
    (err, cours) => {
      //en cas d'erreur sql ou interuption de connexion avec la BDD
      if (err) {
        console.error(err);
        return resultat.sendStatus(500);
      }

      //si l'id du chien est inconnu
      if (cours.length == 0) {
        return resultat.sendStatus(404);
      }

      return resultat.json(cours[0]);
    }
  );
});

app.put("/cours/:id", interceptor, (requete, resultat) => {
  const cours = requete.body;
  cours.id = requete.params.id;

  if (requete.user.role != "coach" && requete.user.role != "admin") {
    return resultat.sendStatus(403);
  }

  if (
    cours.nom_cours == null ||
    cours.nom_cours == "" ||
    cours.nom_cours.length > 20 ||
    cours.type_cours.length > 50
  ) {
    return resultat.sendStatus(400); //bad request
  }

  //verification si le nom du produit existe déjà
  connection.query(
    "SELECT * FROM cours WHERE nom_cours = ? AND id_cours != ?",
    [cours.nom_cours, cours.id],
    (err, courses) => {
      if (courses.length > 0) {
        return resultat.sendStatus(409); //conflict
      }

      connection.query(
        "UPDATE cours SET nom_cours = ?, type_cours = ? WHERE id_cours = ?",
        [cours.nom_cours, cours.type_cours, cours.id],
        (err, lignes) => {
          if (err) {
            console.error(err);
            return resultat.sendStatus(500); //internal server
          }
          return resultat.status(200).json(cours); //OK
        }
      );
    }
  );
});

app.post("/cours", interceptor, (requete, resultat) => {
  const cours = requete.body;

  if (requete.user.role != "admin" && requete.user.role != "coach") {
    return resultat.sendStatus(403);
  }

  //validation
  if (
    cours.nom_cours == null ||
    cours.nom_cours == "" ||
    cours.nom_cours.length > 20 ||
    cours.type_cours.length > 50
  ) {
    return resultat.sendStatus(400); //bad request
  }

  //verification si le nom du produit existe déjà
  connection.query(
    "SELECT * FROM cours WHERE nom_cours = ?",
    [cours.nom_cours],
    (err, courses) => {
      if (courses.length > 0) {
        return resultat.sendStatus(409); //conflict
      }

      connection.query(
        "INSERT INTO cours (nom_cours, type_cours, race_dog, sexe_dog, categorie_acceptee, date_cours) VALUES (?, ?, ?, ?, ?, ?) ",
        [
          cours.nom_cours,
          cours.type_cours,
          cours.race_dog,
          cours.sexe_dog,
          cours.categorie_acceptee,
          cours.date_cours,
          requete.user.id,
        ],
        (err, lignes) => {
          if (err) {
            console.error(err);
            return resultat.sendStatus(500); //internal server,
          }
          return resultat.status(201).json(cours); //created
        }
      );
    }
  );
});

app.delete("/cours/:id", interceptor, (requete, resultat) => {
  //on recup le cours
  connection.query(
    "SELECT * FROM cours WHERE id_cours = ?",
    [requete.params.id],
    (erreur, lignes) => {
      //si il y a une erreur
      if (erreur) {
        console.error(erreur);
        return resultat.sendStatus(500); //internal servor
      }
      //si l'id du chien est inconnu
      if (lignes.length == 0) {
        return resultat.sendStatus(404);
      }
      //on verifie si l'utilisateur connecté est le propriétaire
      const estPropriétaire =
        requete.user.role == "coach" || requete.user.role == "admin";
      // requete.user.id == lignes[0].id_utilisateur;
      console.log(lignes[0], requete.user);

      if (!estPropriétaire) {
        return resultat.sendStatus(403);
      }
      // on supprime le produit
      connection.query(
        "DELETE FROM cours WHERE id_cours = ?",
        [requete.params.id],
        (erreur, lignes) => {
          //si il y a une erreur
          if (erreur) {
            console.error(erreur);
            return resultat.sendStatus(500); //internal servor
          }
          //204 = no content = tout s'est bien passé, mais il n'y a rien dans le corps de la réponse
          return resultat.sendStatus(204);
        }
      );
    }
  );
});

app.post("/inscription", (requete, resultat) => {
  const utilisateur = requete.body;

  const passwordHash = bcrypt.hashSync(utilisateur.password, 10);

  connection.query(
    "INSERT INTO utilisateur(admin_mail, admin_password) VALUES (? , ?) ",
    [utilisateur.email, passwordHash],
    (err, utilisateurs) => {
      if (err && err.code == "ER_DUP_ENTRY") {
        return resultat.sendStatus(409); //conflict
      }

      if (err) {
        console.log(err);
        return resultat.sendStatus(500); //internal server error
      }

      utilisateur.id = utilisateurs.insertId;

      return resultat.json(utilisateur);
    }
  );
});

app.post("/connexion", (requete, resultat) => {
  connection.query(
    "SELECT u.id_utilisateur, u.id_role, u.admin_mail, u.admin_password, r.nom_role FROM utilisateur u JOIN role r ON u.id_role = r.id_role WHERE admin_mail = ?",
    [requete.body.email],
    (erreur, lignes) => {
      if (erreur) {
        console.error(erreur);
        return resultat.sendStatus(500); //internal server error
      }

      // si l'email est inexistant
      if (lignes.length === 0) {
        return resultat.sendStatus(401);
      }

      const motDePasseFormulaire = requete.body.password;
      const motDePasseBaseDeDonnees = lignes[0].admin_password;

      const compatible = bcrypt.compareSync(
        motDePasseFormulaire,
        motDePasseBaseDeDonnees
      );
      console.log(motDePasseBaseDeDonnees, motDePasseFormulaire);
      if (!compatible) {
        return resultat.sendStatus(401);
      }

      return resultat.send(
        jwtUtils.sign(
          {
            sub: requete.body.admin_mail,
            role: lignes[0].nom_role,
            id: lignes[0].id_utilisateur,
          },
          "azerty123"
        )
      );
    }
  );
});

app.listen(5000, () => console.log("le serveur écoute sur le port 5000 !!"));
