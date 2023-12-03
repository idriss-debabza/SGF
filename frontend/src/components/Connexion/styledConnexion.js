// stylesConnexion.js
import { styled } from '@mui/system';
import { Container, TextField, Button, Link, Box } from '@mui/material';

export const StyledContainer = styled(Container)`
  && {
    margin-top: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
`;

export const StyledForm = styled(Box)`
  && {
    width: 100%;
    margin-top: 1em;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
`;

export const StyledTextField = styled(TextField)`
  && {
    width: 100%;
    margin-top: 8px;
  }
`;

export const StyledButton = styled(Button)`
  && {
    width: 100%;
    margin-top: 24px;
    margin-bottom: 16px;
  }
`;

export const StyledLink = styled(Link)`
  && {
    margin-top: 16px;
  }
`;
