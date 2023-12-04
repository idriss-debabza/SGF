import React, { useState, useEffect } from 'react';
import { Grid, List, Collapse, Divider, Typography, ThemeProvider, createTheme } from '@mui/material';
import { CreditCard, Loyalty } from '@mui/icons-material';
import { StyledTypography, StyledList, StyledListItem, StyledListItemTextCard, StyledListItemTextPoint } from './styledDashboard';
import Cookies from 'js-cookie';
import axios from 'axios';



const pointPaymentProducts = [
  { id: 1, name: 'Product 1', price: '$10.99' },
  { id: 2, name: 'Product 2', price: '$15.99' },
  { id: 3, name: 'Product 3', price: '$20.99' },
  { id: 4, name: 'Product 4', price: '$25.99' },
];

function truncateText(text, maxLength) {
  return text.length > maxLength ? `${text.slice(0, maxLength)}...` : text;
}


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
  const [purchaseHistory, setPurchaseHistory] = useState([]);


  useEffect(() => {
    const token = Cookies.get('jwt_token');
    const fetchData = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/purchase`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        console.log(response.data);
        setPurchaseHistory(response.data);
      } catch (error) {
        console.log(error);
      }
    };
  
    fetchData();
  }, []);

  const toggleCardPayment = () => {
    setCardPaymentOpen(!isCardPaymentOpen);
    
  };

  const togglePointPayment = () => {
    setPointPaymentOpen(!isPointPaymentOpen);
    
  };

  const calculateTotalCardPayment = () => {
    const total = purchaseHistory.reduce((acc, purchase) => {
      const priceValue = typeof purchase.product.price === 'string' ?
        parseFloat(purchase.product.price.replace('€', '').trim()) :
        purchase.product.price;

      if (!isNaN(priceValue)) {
        return acc + priceValue;
      } else {
        console.warn('Invalid price value:', purchase.product.price);
        return acc;
      }
    }, 0);

    return total.toFixed(2); // Round to 2 decimal places
  };

  return (
    <ThemeProvider theme={theme}>
      <div>
        <StyledTypography variant="h4" gutterBottom>
          Historique d'achats
        </StyledTypography>
        <Divider style={{ marginBottom: '20px' }} />

        <StyledTypography variant="h5" onClick={toggleCardPayment} style={{ cursor: 'pointer' }}>
        <CreditCard /> Achat avec carte bancaire (Total : {calculateTotalCardPayment()} €)
        </StyledTypography>
        {isCardPaymentOpen && (
          <StyledList>
            {purchaseHistory.map((purchase) => (
              <StyledListItem key={purchase.id}>
                <StyledListItemTextCard primary={truncateText(purchase.product.name, 20)} />
                <StyledListItemTextCard primary={`${purchase.product.price} €`} />
                <StyledListItemTextCard primary={` ${purchase.purchase.typeOperation}`} />
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