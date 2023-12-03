import React, { useState } from "react";
import axios from "axios";
import { Link as RouterLink, useNavigate } from "react-router-dom";
import {
  Container,
  TextField,
  Typography,
  CssBaseline,
  Grid,
  Link,
} from "@mui/material";
import { LockOutlined as LockOutlinedIcon } from "@mui/icons-material";
import {
  StyledPaper,
  StyledAvatar,
  StyledForm,
  StyledSubmit,
} from "./stylesInscription";

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
      const inscriptionResponse = await axios.post("http://localhost:3000/user", {
      firstName: nom, 
      lastName: prenom,
      email: email,
      password: motDePasse,
    });

      console.log(inscriptionResponse.data);
    
      if (inscriptionResponse.status === 201) {
        navigate('/connexion');
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
