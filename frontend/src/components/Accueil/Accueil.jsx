import React from "react";
import { Grid, Typography, Box, Button} from "@mui/material";
import { AddShoppingCart } from "@mui/icons-material"; 
import { Container, StyledCard, StyledCardMedia, StyledCardContent,DiscountInfo } from "./stylesAccueil";

const products = [
  { id: 1, name: "Produit 1", brandName: "Marque 1", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 2, name: "Produit 2", brandName: "Marque 2", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 3, name: "Produit 3", brandName: "Marque 3", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 4, name: "Produit 4", brandName: "Marque 4", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 5, name: "Produit 5", brandName: "Marque 5", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 6, name: "Produit 6", brandName: "Marque 6", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 7, name: "Produit 1", brandName: "Marque 1", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 9, name: "Produit 2", brandName: "Marque 2", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 10, name: "Produit 3", brandName: "Marque 3", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 11, name: "Produit 4", brandName: "Marque 4", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 12, name: "Produit 5", brandName: "Marque 5", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 13, name: "Produit 6", brandName: "Marque 6", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },

];

const Home = () => {
  return (
  <Container maxWidth="xl">
      <Grid container spacing={3}>
        {products.map((product) => (
          <Grid key={product.id} item xs={12} sm={6} md={4} lg={2}>
            <StyledCard>
              <StyledCardMedia component="img" height="200" src={product.imageUrl} alt={product.name} />
              <StyledCardContent>
                <Typography variant="h6" component="div" gutterBottom>
                  {product.name}
                </Typography>
                <Typography variant="body2" color="textSecondary" component="div" gutterBottom>
                  {product.brandName}
                </Typography>
                <Typography variant="body2" color="textSecondary" component="div" gutterBottom>
                  {product.price}
                </Typography> 
                <DiscountInfo  variant="body2"  component="div" gutterBottom> 10 </DiscountInfo> 
                <Box mt={2}>
                  <Button
                    variant="contained"
                    color="info"
                    startIcon={<AddShoppingCart />} // AddShoppingCart icon for the "Add to Cart" button
                  >
                    Acheter
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
