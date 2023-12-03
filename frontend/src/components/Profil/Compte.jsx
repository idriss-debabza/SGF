import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from 'react-router-dom';
import { Container, Grid, Paper } from "@mui/material";
import Menu from './Menu/Menu';
import Contenu from './Contenu/Contenu';
import ProfilUtilisateur from './DetailProfil/ProfilUtilisateur';
import Cookies from 'js-cookie'; // Import the js-cookie library

const Profil = () => {
  const [selectedMenu, setSelectedMenu] = useState("dashboard");
  const navigate = useNavigate();

  useEffect(() => {
    // Get the token from cookies
    const token = Cookies.get('jwt_token');

    if (!token) {
    
      navigate('/connexion');
    }
  }, []);

  const handleLogout = () => {
    // Remove token from cookies
    Cookies.remove('jwt_token');

    // Redirect to login page
    navigate('/connexion');
  };

  return (
    <div style={{ display: "flex" }}>
      <main
        style={{
          flexGrow: 1,
          padding: "20px",
          marginTop: "64px",
          zIndex: 1199,
        }}
      >
        <Container maxWidth="lg">
          <Grid container spacing={3}>
            <Grid item xs={12} md={4}>
              <Paper
                elevation={3}
                style={{ padding: "20px" }}
              >
                <ProfilUtilisateur  handleLogout={handleLogout} />
                <Menu handleMenuClick={setSelectedMenu} />
              </Paper>
            </Grid>
            
            <Grid item xs={12} md={8}>
              <Paper elevation={3} style={{ padding: "20px" }}>
                <Contenu selectedMenu={selectedMenu} />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </main>
    </div>
  );
};

export default Profil;
