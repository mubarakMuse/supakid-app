import React from "react";
import { BrowserRouter as Router, Route, Routes, Navigate } from "react-router-dom";
import ParentView from "./ParentView";
import ChildView from "./ChildView";
import Header from "./Header";
import Footer from "./footer";

function App() {
  return (
    <Router>
      <Header />
      <Routes>
        <Route path="/" element={<ChildView />} />
        <Route path="/settings" element={<ParentView />} />
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
      <Footer />

    </Router>
  );
}

export default App;
