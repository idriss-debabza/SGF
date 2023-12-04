import React, { useState, useEffect } from "react";
import axios from "axios";
import { Grid, Typography, Box, Button } from "@mui/material";
import LocalOfferIcon from "@mui/icons-material/LocalOffer";
import CheckCircleIcon from "@mui/icons-material/CheckCircle";
import StoreIcon from "@mui/icons-material/Store";
import EuroSymbolIcon from "@mui/icons-material/EuroSymbol";
import {
  Container,
  StyledCard,
  StyledCardMedia,
  StyledCardContent,
  DiscountInfo,
} from "./stylesAccueil";

// ... (other imports)

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
                  variant="body1"
                  color="textSecondary"
                  component="div"
                  gutterBottom
                >
                  Price: {product.price} <EuroSymbolIcon />
                </Typography>
                <Typography
                  variant="body1"
                  color="textSecondary"
                  component="div"
                  gutterBottom
                >
                  {product.stock > 0 ? (
                    <React.Fragment>
                      In Stock: {product.stock} <StoreIcon />
                    </React.Fragment>
                  ) : (
                    <React.Fragment>
                      Sold Out <CheckCircleIcon color="error" />
                    </React.Fragment>
                  )}
                </Typography>
                <DiscountInfo variant="body2" component="div" gutterBottom>
                  10% Off <LocalOfferIcon />
                </DiscountInfo>
              </StyledCardContent>
            </StyledCard>
          </Grid>
        ))}
      </Grid>
    </Container>
  );
};

export default Home;
