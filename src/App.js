import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./HomePage";
import ParentView from "./ParentView";
import ChildView from "./ChildView";
import Header from "./Header";
import Footer from "./footer";

function App() {
  return (
    <Router>
           <Header />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/settings" element={<ParentView />} />
        <Route path="/app" element={<ChildView />} />
      </Routes> 
      <Footer />
 
    </Router>
  );
}

export default App;
