// styles.js
import styled from 'styled-components';
import { Card, CardMedia, CardContent, Typography, Rating } from '@mui/material';
import { Link } from 'react-router-dom';

export const Container = styled.div`
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export const LoadingText = styled.p`
  font-size: 18px;
  text-align: center;
  margin-top: 20px;
`;

export const StyledCard = styled(Card)`
  margin-bottom: 20px;
  align-items: center;
`;

export const StyledCardMedia = styled(CardMedia)`
  height: 330px; /* Ajustez la hauteur selon vos besoins */
`;

export const StyledCardContent = styled(CardContent)`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export const AttractionTitle = styled(Typography)`
  font-size: 18px;
  margin-top: 10px;
`;

export const AttractionRating = styled(Rating)`
  margin-top: 10px;
`;

export const SiteLink = styled(Link)`
  margin-top: 10px;
  text-decoration: none;
  color: #007bff; /* Couleur du lien, ajustez selon vos besoins */
  font-weight: bold;
`;
