import React from 'react';
import { List, ListItem, ListItemIcon, ListItemText } from "@mui/material";
import DashboardIcon from "@mui/icons-material/Dashboard";
import PersonIcon from "@mui/icons-material/Person";
import SettingsIcon from "@mui/icons-material/Settings";

const Menu = ({ handleMenuClick }) => {
  return (
    <List style={{ marginTop: "20px" }}>
      {["dashboard", "profile", "settings"].map((menu, index) => (
        <ListItem
          key={index}
          button
          onClick={() => handleMenuClick(menu)}
        >
          <ListItemIcon>
            {menu === "dashboard" && <DashboardIcon />}
            {menu === "profile" && <PersonIcon />}
            {menu === "settings" && <SettingsIcon />}
          </ListItemIcon>
          
          <ListItemText
            primary={menu.charAt(0).toUpperCase() + menu.slice(1)}
          />
        </ListItem>
      ))}
    </List>
  );
};

export default Menu;