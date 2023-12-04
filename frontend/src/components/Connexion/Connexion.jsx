import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Typography } from '@mui/material';
import { StyledContainer, StyledForm, StyledTextField, StyledButton } from './styledConnexion';
import axios from 'axios';
import Cookies from 'js-cookie';
import LockIcon from '@mui/icons-material/Lock';
import EmailIcon from '@mui/icons-material/Email';

const Connexion = () => {
  const [email, setEmail] = useState('');
  const [motDePasse, setMotDePasse] = useState('');
  const navigate = useNavigate();

  const handleConnexion = async () => {
    try {
      const response = await axios.post('http://localhost:3000/auth/login', {
        email,
        password: motDePasse,
      });

      console.log('Réponse du serveur:', response.data);
      if (response.status === 201 && response.data.accessToken) {
        console.log('Connexion réussie');
        Cookies.set('jwt_token', response.data.accessToken        );
        navigate('/compte');
      } else {
        console.error('Échec de la connexion');
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
            startAdornment: <EmailIcon color="action" sx={{ marginRight: 1 }} />,
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
            startAdornment: <LockIcon color="action" sx={{ marginRight: 1 }} />,
          }}
        />
        <StyledButton
          type="button"
          variant="contained"
          color="action"
          onClick={handleConnexion}
        >
          Se connecter
        </StyledButton>
      </StyledForm>
    </StyledContainer>
  );
};

export default Connexion;
