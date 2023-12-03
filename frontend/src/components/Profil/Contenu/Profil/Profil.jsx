import React from "react";
import { Typography, Divider, Button } from "@mui/material";


const Profile = () => {
  const userId = localStorage.getItem("userId");
  return (
    <div>
      <Typography variant="h5" gutterBottom>
        Trait Personnalité
      </Typography>
      <Divider style={{ marginBottom: "20px" }} />
      
      
    </div>
  );
};

export default Profile;
