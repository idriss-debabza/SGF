import React from 'react';
import { Typography, Divider } from "@mui/material";

const Dashboard = () => {
    const userId = localStorage.getItem("userId");
    return(
    <div>
        <Typography variant="h5" gutterBottom>
            Historique d'achats
        </Typography>
        <Divider style={{ marginBottom: "20px" }} />
        <Typography variant="body1">
            Achat
        </Typography>
        
        
    </div>
    );
    };

export default Dashboard;