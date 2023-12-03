import React from 'react';
import Dashboard from './Dashboard/Dashboard';
import Profile from './Profil/Profil';
import Settings from './Paramettre/Settings';

const Contenu = ({ selectedMenu }) => {
  switch (selectedMenu) {
    case "dashboard":
      return <Dashboard />;
    case "profile":
      return <Profile />;
    case "settings":
      return <Settings />;
    default:
      return null;
  }
};

export default Contenu;