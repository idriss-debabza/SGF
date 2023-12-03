import React from 'react';
import { Typography, Avatar, Button } from "@mui/material";

const ProfilUtilisateur = ({ user, handleLogout }) => {
    return (
        <div style={{ textAlign: "center" }}>
            <Avatar
                alt="User Avatar"
                src=""
                style={{
                    width: "100px",
                    height: "100px",
                    marginBottom: "20px",
                }}
            />
            {user && (
                <>
                    <Typography variant="h6" gutterBottom>
                        {user.prenom} {user.nom}
                    </Typography>
                </>
            )}
            <Button variant="contained" color="secondary" onClick={handleLogout}>
                Déconnexion
            </Button>
        </div>
    );
};

export default ProfilUtilisateur;