import React, { useState, useEffect } from "react";
import { Typography, Avatar, Button, Paper } from "@mui/material";
import Cookies from "js-cookie";
import axios from "axios";

const ProfilUtilisateur = ({ handleLogout }) => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  

  useEffect(() => {
    const token = Cookies.get('jwt_token');

    axios.get(`http://localhost:3000/user`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
    .then((response) => {
      setFirstName(response.data.firstName);
      setLastName(response.data.lastName);
      Cookies.set('totalDiscount', response.data.totalDiscount);
      
    })
    .catch((error) => {
      console.error(
        "Erreur lors de la récupération de l'utilisateur:",
        error
      );
    });

  }, []);

  return (
    <Paper
      elevation={3}
      style={{
        maxWidth: "300px",
        margin: "auto",
        padding: "20px",
        textAlign: "center",
      }}
    >
      <Avatar
        alt="User Avatar"
        src=""
        style={{
          width: "100px",
          height: "100px",
          marginBottom: "20px",
          border: "2px solid #000",
          margin: "auto",
          marginTop: "20px",
        }}
      />

      <Typography variant="h6" style={{ marginBottom: "20px" }}>
        {`${firstName} ${lastName}` }
      </Typography>

      <Typography variant="h6" style={{ marginBottom: "20px" }}>
      Total des points : {Cookies.get('totalDiscount')}
      </Typography>

      <Button
        variant="contained"
        color="primary"
        onClick={handleLogout}
        style={{ marginTop: "20px" }}
      >
        Déconnexion
      </Button>
    </Paper>
  );
};

export default ProfilUtilisateur;
