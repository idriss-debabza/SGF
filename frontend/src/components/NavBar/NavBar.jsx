// NavBar.jsx
import React from 'react';
import { StyledAppBar, StyledTypography, StyledButton } from './styles';
import { Link } from 'react-router-dom';
import Toolbar from '@mui/material/Toolbar';  // Assurez-vous d'importer Toolbar depuis '@mui/material'

export default function NavBar() {
  return (
    <div>
      <StyledAppBar position="static">
        <Toolbar>
          <StyledTypography variant="h6" component={Link} to="/accueil">
            Accueil
          </StyledTypography>
          <StyledButton component={Link} to="/compte">
            Profil
          </StyledButton>
          <StyledButton component={Link} to="/connexion">
            Connexion
          </StyledButton>
          <StyledButton component={Link} to="/inscription">
            Inscription
          </StyledButton>
        </Toolbar>
      </StyledAppBar>
    </div>
  );
}
