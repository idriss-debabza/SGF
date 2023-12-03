import React from 'react';
import {
  StyledPaper,
  StyledTypography,
  StyledGridItem,
  StyledButton,
} from './stylesProfil';

import { Divider } from '@mui/material';

const Profile = () => {
  
  return (
    <StyledPaper>
      <StyledTypography variant="h4" gutterBottom>
        Détails du profil
      </StyledTypography>
      <Divider />
      <StyledGridItem container spacing={2}>
        <StyledGridItem item xs={6}>
          <StyledTypography variant="body1">Nom: John Doe</StyledTypography>
        </StyledGridItem>
        <StyledGridItem item xs={6}>
          <StyledTypography variant="body1">Prénom: John</StyledTypography>
        </StyledGridItem>
        <StyledGridItem item xs={12}>
          <StyledTypography variant="body1">
            Email: john.doe@example.com
          </StyledTypography>
        </StyledGridItem>
        <StyledGridItem item xs={12}>
          <StyledTypography variant="body1">
            Adresse Email: 123 Main St, Cityville
          </StyledTypography>
        </StyledGridItem>
      </StyledGridItem>
      <Divider />
      <StyledButton variant="contained" color="primary">
        Modifier
      </StyledButton>
    </StyledPaper>
  );
};

export default Profile;
