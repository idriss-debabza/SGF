import React, { useState, useEffect } from 'react';
import { Divider, Card, CardContent, Typography, Grid } from '@mui/material';
import EditIcon from '@mui/icons-material/Edit';
import { StyledPaper, StyledTypography, StyledGridItem, StyledButton } from './stylesProfil';
import Cookies from 'js-cookie';
import axios from 'axios';

const Profile = () => {
  const [userDetails, setUserDetails] = useState({
    firstname: '',
    lastname: '',
    email: '',
  });

  useEffect(() => {
    const token = Cookies.get('jwt_token');

    axios
      .get(`http://localhost:3000/user`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((response) => {
        console.log('Réponse du serveur:', response);
        setUserDetails({
          firstname: response.data.firstName,
          lastname: response.data.lastName,
          email: response.data.email,
        });
      })
      .catch((error) => {
        console.error('Erreur lors de la récupération de l\'utilisateur:', error);
      });
  }, []);

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
                  <Typography variant="body1">Nom: {userDetails.lastname}</Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Prénom: {userDetails.firstname}</Typography>
                </StyledGridItem>
                <StyledGridItem item xs={12}>
                  <Typography variant="body1">Email: {userDetails.email}</Typography>
                </StyledGridItem>
              </StyledGridItem>
            </CardContent>
          </Card>
        </Grid>
      </Grid>
      <Divider />
    </StyledPaper>
  );
};

export default Profile;
