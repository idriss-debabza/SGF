// styles.js
import { styled } from '@mui/system';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import { Link } from 'react-router-dom';

export const StyledAppBar = styled(AppBar)({
  backgroundColor: '#2196f3', // Changer la couleur de fond selon vos préférences
  borderRadius: 2,
  margin: ' 0',

});

export const StyledTypography = styled(Typography)({
  flexGrow: 1,
  textAlign: 'left',
  fontFamily: 'cursive', // Changer la police selon vos préférences
  fontSize: '1.5rem', // Changer la taille du texte selon vos préférences
  color: 'white', // Changer la couleur du texte selon vos préférences
});

export const StyledButton = styled(Button)({
  color: 'white', // Changer la couleur du texte des boutons selon vos préférences
  '&:hover': {
    backgroundColor: '#1565c0', // Changer la couleur de fond au survol du bouton
  },
});
