import React, { useState } from 'react';
import { Grid, List, Collapse, Divider, Typography, ThemeProvider, createTheme } from '@mui/material';
import { CreditCard, Loyalty } from '@mui/icons-material';
import { StyledTypography, StyledList, StyledListItem, StyledListItemTextCard, StyledListItemTextPoint } from './styledDashboard';

const cardPaymentProducts = [
  { id: 1, name: 'Product 1', price: '$10.99' },
  { id: 2, name: 'Product 2', price: '$15.99' },
  { id: 3, name: 'Product 3', price: '$20.99' },
  { id: 4, name: 'Product 4', price: '$25.99' },
];

const pointPaymentProducts = [
  { id: 1, name: 'Product 1', price: '$10.99' },
  { id: 2, name: 'Product 2', price: '$15.99' },
  { id: 3, name: 'Product 3', price: '$20.99' },
  { id: 4, name: 'Product 4', price: '$25.99' },
];


const theme = createTheme({
  palette: {
    primary: {
      main: '#2196f3',
    },
    secondary: {
      main: '#f44336',
    },
  },
  typography: {
    fontFamily: 'Roboto, sans-serif',
  },
});

const Dashboard = () => {
  const [isCardPaymentOpen, setCardPaymentOpen] = useState(false);
  const [isPointPaymentOpen, setPointPaymentOpen] = useState(false);

  const toggleCardPayment = () => {
    setCardPaymentOpen(!isCardPaymentOpen);
    
  };

  const togglePointPayment = () => {
    setPointPaymentOpen(!isPointPaymentOpen);
    
  };

  return (
    <ThemeProvider theme={theme}>
      <div>
        <StyledTypography variant="h4" gutterBottom>
          Historique d'achats
        </StyledTypography>
        <Divider style={{ marginBottom: '20px' }} />

        <StyledTypography variant="h5" onClick={toggleCardPayment} style={{ cursor: 'pointer' }}>
          <CreditCard /> Achat avec carte bancaire
        </StyledTypography>
        {isCardPaymentOpen && (
          <StyledList>
            {cardPaymentProducts.map((product) => (
              <StyledListItem key={product.id}>
                <StyledListItemTextCard primary={product.name} />
                <StyledListItemTextCard primary={product.price} />
              </StyledListItem>
            ))}
          </StyledList>
        )}

        <Divider style={{ marginBottom: '20px' }} />
        <StyledTypography variant="h5" onClick={togglePointPayment} style={{ cursor: 'pointer' }}>
          <Loyalty /> Achat avec points
        </StyledTypography>
        {isPointPaymentOpen && (
          <StyledList>
            {pointPaymentProducts.map((product) => (
              <StyledListItem key={product.id}>
                <StyledListItemTextPoint primary={product.name} />
                <StyledListItemTextPoint primary={product.price} />
              </StyledListItem>
            ))}
          </StyledList>
        )}
      </div>
    </ThemeProvider>
  );
};

export default Dashboard;
