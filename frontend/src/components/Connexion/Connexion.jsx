import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Container,
  Typography,
  TextField,
  Button,
  Link,
  Box,
} from '@mui/material';
import axios from 'axios';
import LockIcon from '@mui/icons-material/Lock';
import EmailIcon from '@mui/icons-material/Email';
import { styled } from '@mui/system';

const StyledContainer = styled(Container)`
  && {
    margin-top: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
`;

const StyledForm = styled(Box)`
  && {
    width: 100%;
    margin-top: 1em;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
`;

const StyledTextField = styled(TextField)`
  && {
    width: 100%;
    margin-top: 8px;
  }
`;

const StyledButton = styled(Button)`
  && {
    width: 100%;
    margin-top: 24px;
    margin-bottom: 16px;
  }
`;

const StyledLink = styled(Link)`
  && {
    margin-top: 16px;
  }
`;

const Connexion = () => {
  const [email, setEmail] = useState('');
  const [motDePasse, setMotDePasse] = useState('');
  const navigate = useNavigate();

  const handleConnexion = async () => {
    try {
      const response = await axios.post('http://localhost:8000/api/connexion', {
        email,
        motDePasse,
      });

      console.log('Réponse du serveur:', response);

      if (response.status === 200) {
        console.log('Connexion réussie');
        // Store the user ID and token in localStorage
        localStorage.setItem('userId', response.data.userId);
        localStorage.setItem('token', response.data.token);
        // Utiliser useNavigate pour rediriger l'utilisateur vers la page profil
        navigate('/profil');
      } else {
        console.error('Échec de la connexion');
        // Gérer les erreurs ou afficher un message d'échec de connexion
      }
    } catch (error) {
      console.error('Erreur lors de la connexion:', error);
    }
  };

  return (
    <StyledContainer component="main" maxWidth="xs">
      <Typography variant="h3" gutterBottom>
        Connexion
      </Typography>
      <StyledForm component="form" noValidate>
        <StyledTextField
          variant="outlined"
          margin="normal"
          required
          fullWidth
          id="email"
          label="Adresse Email"
          name="email"
          autoComplete="email"
          autoFocus
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          InputProps={{
            startAdornment: (
              <EmailIcon color="action" sx={{ marginRight: 1 }} />
            ),
          }}
        />
        <StyledTextField
          variant="outlined"
          margin="normal"
          required
          fullWidth
          name="motDePasse"
          label="Mot de passe"
          type="password"
          id="motDePasse"
          autoComplete="current-password"
          value={motDePasse}
          onChange={(e) => setMotDePasse(e.target.value)}
          InputProps={{
            startAdornment: (
              <LockIcon color="action" sx={{ marginRight: 1 }} />
            ),
          }}
        />
        <StyledButton
          type="button"
          variant="contained"
          color="primary"
          onClick={handleConnexion}
        >
          Se connecter
        </StyledButton>
        <StyledLink href="#" variant="body2">
          Mot de passe oublié ?
        </StyledLink>
      </StyledForm>
    </StyledContainer>
  );
};

export default Connexion;
