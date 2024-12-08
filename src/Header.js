import React, { useState } from "react";
import { Link } from "react-router-dom";
// import logo from "./logo.png";
import { Bars3Icon, XMarkIcon } from "@heroicons/react/24/outline"; // Updated icons

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <nav className="bg-blue-500 text-white shadow-lg">
      <div className="container mx-auto flex justify-between items-center py-4 px-6">
        {/* Logo and Title */}
        <Link to="/">
          <span className="text-2xl font-bold tracking-wide">SupaKid</span>
        </Link>


        {/* Hamburger Icon for Mobile */}
        <button className="md:hidden focus:outline-none" onClick={toggleMenu}>
          {isMenuOpen ? (
            <XMarkIcon className="h-8 w-8 text-white" />
          ) : (
            <Bars3Icon className="h-8 w-8 text-white" />
          )}
        </button>

        {/* Navigation Links for Desktop */}
        <div className="hidden md:flex space-x-6 text-lg">
          <Link to="/" className="hover:text-gray-300 hover:underline transition duration-200">
            App
          </Link>
          <Link to="/settings" className="hover:text-gray-300 hover:underline transition duration-200">
            Settings
          </Link>

        </div>
      </div>

      {/* Mobile Menu */}
      {isMenuOpen && (
        <div className="md:hidden bg-blue-500">
          <div className="flex flex-col items-center space-y-4 py-4">
            <Link
              to="/"
              className="text-white hover:text-gray-300 hover:underline transition duration-200"
              onClick={() => setIsMenuOpen(false)}
            >
              App
            </Link>
            <Link
              to="/settings"
              className="text-white hover:text-gray-300 hover:underline transition duration-200"
              onClick={() => setIsMenuOpen(false)}
            >
              Settings
            </Link>

          </div>
        </div>
      )}
    </nav>
  );
};

export default Header;
