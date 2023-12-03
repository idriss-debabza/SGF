import React from 'react';
import {
  StyledTypography,
  StyledList,
  StyledListItem,
  StyledListItemTextCard,
    StyledListItemTextPoint,
} from './styledDashboard';
import { Divider } from '@mui/material';

const Dashboard = () => {
  const userId = localStorage.getItem('userId');

  // Sample product data with images
  const cardPaymentProducts = [
    { id: 1, name: 'Product 1', price: '$10.99' },
    { id: 2, name: 'Product 2', price: '$15.99' },
    { id: 3, name: 'Product 3', price: '$20.99' },
    { id: 4, name: 'Product 4', price: '$25.99' },
    // Add more products as needed
  ];
  const pointPaymentProducts = [
    { id: 1, name: 'Product 1', price: '$10.99' },
    { id: 2, name: 'Product 2', price: '$15.99' },
    { id: 3, name: 'Product 3', price: '$20.99' },
    { id: 4, name: 'Product 4', price: '$25.99' },
    // Add more products as needed
  ];

  const renderProductListCard = (products) => {
    return (
      <StyledList>
        {products.map((product) => (
          <StyledListItem key={product.id}>
            <StyledListItemTextCard primary={product.name} />
            <StyledListItemTextCard primary={product.price} />
          </StyledListItem>
        ))}
      </StyledList>
    );
  };
  const renderProductListPoint = (products) => {
    return (
      <StyledList>
        {products.map((product) => (
          <StyledListItem key={product.id}>
            <StyledListItemTextPoint primary={product.name} />
            <StyledListItemTextPoint primary={product.price} />
          </StyledListItem>
        ))}
      </StyledList>
    );
  };

  return (
    <div>
      <StyledTypography variant="h4" gutterBottom>
        Historique d'achats
      </StyledTypography>
      <Divider style={{ marginBottom: '20px' }} />

      <StyledTypography variant="h5">Achat avec carte bancaire</StyledTypography>
      {renderProductListCard(cardPaymentProducts)}

      <Divider style={{ marginBottom: '20px' }} />
      <StyledTypography variant="h5">Achat avec points</StyledTypography>
      {renderProductListPoint(pointPaymentProducts)}
    </div>
  );
};

export default Dashboard;
