// App.js
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/NavBar/NavBar';
import Home from './components/Accueil/Accueil';
import Inscription from './components/Inscription/Inscription';
import Connexion from './components/Connexion/Connexion';
import Compte from './components/Profil/Compte';

const App = () => {
  return (
    <Router>
      <div>
        <Navbar />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/accueil" element={<Home />} />
          <Route path="/inscription" element={<Inscription />} />
          <Route path="/connexion" element={<Connexion />} />
          <Route path="/compte" element={<Compte />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;
