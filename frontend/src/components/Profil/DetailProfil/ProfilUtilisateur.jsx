import React from 'react';
import { Typography, Avatar, Button, Paper } from "@mui/material";

const ProfilUtilisateur = ({handleLogout }) => {
    return (
        
        <Paper elevation={3} style={{ maxWidth: '300px', margin: 'auto', padding: '20px', textAlign: 'center' }}>
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
            
                
                
                <Typography variant="h6" style={{ marginBottom: '20px' }}>

                        utilisateur
                    </Typography>
                
            
            <Button variant="contained" color="primary" onClick={handleLogout} style={{ marginTop: '20px' }}>
                Déconnexion
            </Button>
        </Paper>
        
    );
};

export default ProfilUtilisateur;
