import styled from 'styled-components';
import { Card, CardMedia, CardContent, Typography, Rating, Button, Box } from '@mui/material';
import { Link } from 'react-router-dom';

export const Container = styled.div`
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 60px;
  /* maxWidth: 100%; Remove this line if not needed */
`;

export const StyledCard = styled(Card)`
  width: 100%;
  max-width: 300px; 
  border: 1px solid #ddd; 
  transition: transform 0.2s; 
  margin: 0 auto;

  &:hover {
    transform: scale(1.05);
  }
`;

export const StyledCardMedia = styled(CardMedia)`
  height: 200px;
`;

export const StyledCardContent = styled(CardContent)`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export const AttractionTitle = styled(Typography)`
  font-size: 16px; 
  margin-top: 10px;
`;

export const AttractionRating = styled(Rating)`
  margin-top: 10px;
`;

export const DiscountInfo = styled(Typography)`
  margin-top: 5px;
  color: #ff0000; 
`;

export const BuyButton = styled(Button)`
  margin-top: 10px;
`;

export const SiteLink = styled(Link)`
  margin-top: 10px;
  text-decoration: none;
  color: #007bff;
  font-weight: bold;
`;
