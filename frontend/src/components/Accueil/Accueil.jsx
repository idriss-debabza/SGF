import React, { useState, useEffect } from "react";
import axios from "axios";
import { Grid, Typography, Box, Button } from "@mui/material";
import { AddShoppingCart } from "@mui/icons-material";
import {
  Container,
  StyledCard,
  StyledCardMedia,
  StyledCardContent,
  DiscountInfo,
} from "./stylesAccueil";

const Home = () => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get("http://localhost:3000/product");
        setProducts(response.data);
      } catch (error) {
        console.error("Erreur lors de la récupération des produits :", error);
      }
    };

    fetchData();
  }, []); 

  return (
    <Container maxWidth="xl">
      <Grid container spacing={3}>
        {products.map((product) => (
          <Grid key={product.id} item xs={12} sm={6} md={4} lg={2}>
            <StyledCard>
              <StyledCardMedia
                component="img"
                height="200"
                src={product.imgUrl}
                alt={product.name}
              />
              <StyledCardContent>
                <Typography variant="h6" component="div" gutterBottom>
                  {product.name}
                </Typography>
                <Typography
                  variant="body2"
                  color="textSecondary"
                  component="div"
                  gutterBottom
                >
                  {product.brandName}
                </Typography>
                <Typography
                  variant="body2"
                  color="textSecondary"
                  component="div"
                  gutterBottom
                >
                  {product.price}
                </Typography>
                <DiscountInfo variant="body2" component="div" gutterBottom>
                  10% Off
                </DiscountInfo>
                <Box mt={2}>
                  <Button
                    variant="contained"
                    color="info"
                    startIcon={<AddShoppingCart />}
                  >
                    Add to Cart
                  </Button>
                </Box>
              </StyledCardContent>
            </StyledCard>
          </Grid>
        ))}
      </Grid>
    </Container>
  );
};

export default Home;
