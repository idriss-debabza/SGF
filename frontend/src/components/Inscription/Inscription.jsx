import React, { useState } from "react";
import axios from "axios";
import { Link as RouterLink, useNavigate } from "react-router-dom";
import {
  Container,
  Paper,
  TextField,
  Button,
  Typography,
  Avatar,
  CssBaseline,
  Grid,
  Link,
  styled,
} from "@mui/material";
import { LockOutlined as LockOutlinedIcon } from "@mui/icons-material";

const StyledPaper = styled(Paper)({
  display: "flex",
  flexDirection: "column",
  alignItems: "center",
  padding: "20px",
  marginTop: "50px",
});

const StyledAvatar = styled(Avatar)({
  margin: "8px",
  backgroundColor: "#1976D2",
});

const StyledForm = styled("form")({
  width: "100%", // Fix IE 11 issue.
  marginTop: "8px",
});

const StyledSubmit = styled(Button)({
  margin: "24px 0 16px",
});

const Inscription = () => {
  const [nom, setNom] = useState("");
  const [prenom, setPrenom] = useState("");
  const [email, setEmail] = useState("");
  const [motDePasse, setMotDePasse] = useState("");
  const [confirmMotDePasse, setConfirmMotDePasse] = useState("");
  const navigate = useNavigate();

  const handleInscription = async () => {
    try {
      if (motDePasse !== confirmMotDePasse) {
        console.error("Les mots de passe ne correspondent pas");
        return;
      }

      // Enregistrez l'utilisateur dans la base de données
      const inscriptionResponse = await axios.post("http://localhost:8000/api/inscription", {
        nom,
        prenom,
        email,
        motDePasse,
      });

      console.log(inscriptionResponse.data);
      // Vérifiez si la réponse contient un token
    if (inscriptionResponse.data && inscriptionResponse.data.token) {
      // Stockez le token dans le localStorage
      localStorage.setItem('authToken', inscriptionResponse.data.token);
      console.log("Token stocké dans le localStorage");

    } else {
      console.error("Aucun token reçu du serveur");
    }

      // Une fois l'inscription réussie, redirigez l'utilisateur vers le test de personnalité
      if (inscriptionResponse.status === 200) {
        // Ajoutez votre logique de redirection ici (par exemple, utiliser react-router-dom)
        // Remplacez '/testepersonnalite' par le chemin de votre page de test de personnalité
        navigate('/testepersonnalite');
      }
    } catch (error) {
      console.error("Erreur lors de l'inscription:", error);
    }
  };

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <StyledPaper elevation={3}>
        <StyledAvatar>
          <LockOutlinedIcon />
        </StyledAvatar>
        <Typography component="h1" variant="h5">
          Inscription
        </Typography>
        <StyledForm>
          <Grid container spacing={2}>
            <Grid item xs={12} sm={6}>
              <TextField
                autoComplete="fname"
                name="nom"
                variant="outlined"
                required
                fullWidth
                id="nom"
                label="Nom"
                autoFocus
                value={nom}
                onChange={(e) => setNom(e.target.value)}
              />
            </Grid>
            <Grid item xs={12} sm={6}>
              <TextField
                autoComplete="lname"
                name="prenom"
                variant="outlined"
                required
                fullWidth
                id="prenom"
                label="Prénom"
                value={prenom}
                onChange={(e) => setPrenom(e.target.value)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                type="email"
                variant="outlined"
                required
                fullWidth
                id="email"
                label="Email"
                name="email"
                autoComplete="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                required
                fullWidth
                name="motDePasse"
                label="Mot de passe"
                type="password"
                id="motDePasse"
                autoComplete="current-password"
                value={motDePasse}
                onChange={(e) => setMotDePasse(e.target.value)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                required
                fullWidth
                name="confirmMotDePasse"
                label="Confirmer le mot de passe"
                type="password"
                id="confirmMotDePasse"
                autoComplete="current-password"
                value={confirmMotDePasse}
                onChange={(e) => setConfirmMotDePasse(e.target.value)}
              />
            </Grid>
          </Grid>
          <StyledSubmit
            type="button"
            fullWidth
            variant="contained"
            color="primary"
            onClick={handleInscription}
          >
            S'inscrire
          </StyledSubmit>
          <Grid container justifyContent="flex-end">
            <Grid item>
              <Link component={RouterLink} to="/connexion" variant="body2">
                Vous avez déjà un compte ? Connectez-vous
              </Link>
            </Grid>
          </Grid>
        </StyledForm>
      </StyledPaper>
    </Container>
  );
};

export default Inscription;
