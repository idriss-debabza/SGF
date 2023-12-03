import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from 'react-router-dom';
import { Container, Grid, Paper } from "@mui/material";
import Menu from './Menu/Menu';
import Contenu from './Contenu/Contenu';
import ProfilUtilisateur from './DetailProfil/ProfilUtilisateur';
import { jwtDecode } from 'jwt-decode';

const Profil = () => {
  const [selectedMenu, setSelectedMenu] = useState("dashboard");
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    // Get the user ID from localStorage
    const userId = localStorage.getItem("userId");
    // Get the token from localStorage
    const token = localStorage.getItem("token");
    try {
      const decodedToken = jwtDecode(token);
      console.log(decodedToken);
    } catch (error) {
      console.error('Erreur lors du décodage du token :', error.message);
    }
    if (userId && token) {
      axios
        .get(`http://localhost:8000/utilisateurs/${userId}`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((response) => {
          setUser(response.data);
        })
        .catch((error) => {
          console.error(
            "Erreur lors de la récupération de l'utilisateur:",
            error
          );
        });
    } else {
      // Redirect to login page
      navigate('/connexion');
    }
  }, []);

  const handleLogout = () => {
    // Remove userId and token from localStorage
    localStorage.removeItem('userId');
    localStorage.removeItem('token');
    

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
                <ProfilUtilisateur user={user} handleLogout={handleLogout} />
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