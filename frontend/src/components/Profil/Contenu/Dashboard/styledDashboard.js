import { styled } from '@mui/system';
import { Paper, Typography,Grid, Button, List, ListItem, ListItemText } from '@mui/material';

export const StyledPaper = styled(Paper)({
  padding: '16px',
  maxWidth: '400px',
  margin: 'auto',
});

export const StyledTypography = styled(Typography)({
  marginBottom: '8px',
});

export const StyledGridItem = styled(Grid)({
  marginBottom: '16px',
});

export const StyledButton = styled(Button)({
  marginTop: '16px',
});

// Styles for List, ListItem, and ListItemText
export const StyledList = styled(List)({
  marginTop: '16px',
});

export const StyledListItem = styled(ListItem)({
  border: '1px solid #ddd',
  marginBottom: '8px',
});

export const StyledListItemTextCard = styled(ListItemText)({
  color: 'blue', // Customize text color as needed
});

export const StyledListItemTextPoint= styled(ListItemText)({
  color: 'red', // Customize text color as needed
});
