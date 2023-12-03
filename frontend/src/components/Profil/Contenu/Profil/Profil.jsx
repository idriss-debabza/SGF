import React from 'react';
import {
  StyledPaper,
  StyledTypography,
  StyledGridItem,
  StyledButton,
} from './stylesProfil';

import { Divider, Avatar, IconButton, Card, CardContent, Typography, Grid } from '@mui/material';
import EditIcon from '@mui/icons-material/Edit';

const Profile = () => {
  return (
    <StyledPaper>
      <div style={{ display: 'flex', alignItems: 'center', marginBottom: '16px' }}>
        
        <div>
          <StyledTypography variant="h4" gutterBottom>
            Détails du profil
          </StyledTypography>
        </div>
      </div>
      <Divider />
      <Grid container spacing={1}>
        <Grid item xs={12} sm={12}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Informations personnelles
              </Typography>
              <Divider />
              <StyledGridItem container spacing={0}>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Nom: Utilisateur </Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Prénom: Utilisateur</Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Email: utilisateur@gmail.com</Typography>
                </StyledGridItem>
              </StyledGridItem>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} sm={12}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Adresse
              </Typography>
              <Divider />
              <StyledGridItem container spacing={0}>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Adresse: 1 rue quelque chose</Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Ville: St-Denis</Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Code postal: 93000</Typography>
                </StyledGridItem>
              </StyledGridItem>
            </CardContent>
          </Card>
        </Grid>
      </Grid>
      <Divider />
      <StyledButton variant="contained" color="primary">
        Modifier le profil
      </StyledButton>
    </StyledPaper>
  );
};

export default Profile;
