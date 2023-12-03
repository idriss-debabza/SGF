import React from "react";
import { Grid, Typography, Box } from "@mui/material";
import { Container, StyledCard, StyledCardMedia, StyledCardContent } from "./stylesAccueil";

const products = [
  { id: 1, name: "Produit 1", brandName: "Marque 1", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 2, name: "Produit 2", brandName: "Marque 2", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 3, name: "Produit 3", brandName: "Marque 3", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 4, name: "Produit 4", brandName: "Marque 4", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 5, name: "Produit 5", brandName: "Marque 5", price: "$19.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
  { id: 6, name: "Produit 6", brandName: "Marque 6", price: "$29.99", imageUrl: "https://pic.clubic.com/v1/images/1863496/raw?fit=max&width=1200&hash=aac01b0be4face7b3719d47922f772b717b223a8" },
];

const Home = () => {
  return (
    <Container>
      <Grid container spacing={2}>
        {products.map((product) => (
          <Grid key={product.id} item xs={12} sm={6} md={3}>
            {/* Updated sm and md props */}
            <StyledCard>
              <StyledCardMedia component="img" height="500" src={product.imageUrl} alt={product.name} />
              <StyledCardContent>
                <Box display={"flex"} justifyContent={"space-between"}>
                  <Typography variant="h6" component="div">
                    {product.name}
                  </Typography>
                </Box>
                <Box display={"flex"} justifyContent={"space-between"}>
                  <Typography variant="body2" color="textSecondary" component="div">
                    {product.brandName}
                  </Typography>
                </Box>
                <Box display={"flex"} justifyContent={"space-between"}>
                  <Typography variant="body2" color="textSecondary" component="div">
                    {product.price}
                  </Typography>
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
