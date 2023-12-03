import React, { useState } from 'react';
import { Grid, List, Collapse, Divider, Typography, ThemeProvider, createTheme } from '@mui/material';
import { CreditCard, Loyalty } from '@mui/icons-material';
import { StyledTypography, StyledList, StyledListItem, StyledListItemTextCard, StyledListItemTextPoint } from './styledDashboard';

const Products = [
  { id: 1, name: 'Product 1', price: '$10.99' , discount  : '20%' },
  { id: 2, name: 'Product 2', price: '$15.99', discount  : '20%' },
  { id: 3, name: 'Product 3', price: '$20.99' , discount  : '20%'},
  { id: 4, name: 'Product 4', price: '$25.99', discount  : '20%' },
];

const pointPaymentProducts = [
  { id: 1, name: 'Product 1', price: '$10.99', discount  : '20%' },
  { id: 2, name: 'Product 2', price: '$15.99' , discount  : '20%'},
  { id: 3, name: 'Product 3', price: '$50.99', discount  : '20%' },
  { id: 4, name: 'Product 4', price: '$25.99' , discount  : '20%'},
];

const purchaseHistory = [
  { id: 1, type: 'cardPayment', products: Products },
  { id: 2, type: 'pointPayment', products: pointPaymentProducts },
  { id: 3, type: 'cardPayment', products: Products },
  { id: 4, type: 'cardPayment', products: Products },
  { id: 5, type: 'pointPayment', products: Products },
  // Add more purchase history entries as needed
];

const calculateTotalPrice = (products) => {
  return products.reduce((total, product) => total + parseFloat(product.price.replace('$', '')), 0).toFixed(2);
};


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
  const [openPurchase, setOpenPurchase] = useState(null);

  const togglePurchase = (id) => {
    setOpenPurchase((prevOpenPurchase) => (prevOpenPurchase === id ? null : id));
  };

 
  return (
    <ThemeProvider theme={theme}>
      <div>
        <StyledTypography variant="h4" gutterBottom>
          Historique d'achats
        </StyledTypography>
        <Divider style={{ marginBottom: '20px' }} />

        {purchaseHistory.map((purchase) => (
          <div key={purchase.id}>
            <StyledTypography
              variant="h5"
              onClick={() => togglePurchase(purchase.id)}
              style={{ cursor: 'pointer', color: purchase.type === 'cardPayment' ? '#2196f3' : '#f44336' }}
            >
              {purchase.type === 'cardPayment' ? <CreditCard /> : <Loyalty />} Achat {purchase.id}
              <span style={{ marginLeft: '10px', fontWeight: 'normal' }}>(Total: ${calculateTotalPrice(purchase.products)})</span>
        
            </StyledTypography>
            <Collapse in={openPurchase === purchase.id}>
              <StyledList>
                {purchase.products.map((product) => (
                  <StyledListItem key={product.id}>
                    {purchase.type === 'cardPayment' ? (
                      <>
                        <StyledListItemTextCard primary={product.name} />
                        <StyledListItemTextCard primary={product.price} />
                        <StyledListItemTextCard primary={product.discount} />
                      </>
                    ) : (
                      <>
                        <StyledListItemTextPoint primary={product.name} />
                        <StyledListItemTextPoint primary={product.price} />
                        <StyledListItemTextPoint primary={product.discount} />
                      </>
                    )}
                  </StyledListItem>
                ))}
              </StyledList>
            </Collapse>
            <Divider style={{ marginBottom: '20px' }} />
          </div>
        ))}
      </div>
    </ThemeProvider>
  );
};

export default Dashboard;
