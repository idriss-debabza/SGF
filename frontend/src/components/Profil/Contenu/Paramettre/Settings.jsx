import React from 'react';
import { Typography, Divider, Button } from "@mui/material";

const Settings = () => (
    <div>
        <Typography variant="h5" gutterBottom>
            Parametre
        </Typography>
        <Divider style={{ marginBottom: "20px" }} />
        <Typography variant="body1">Configuration</Typography>
        <Button
            variant="contained"
            color="primary"
            style={{ marginTop: "20px" }}
        >
            Ouvrir Parametre
        </Button>
    </div>
);

export default Settings;