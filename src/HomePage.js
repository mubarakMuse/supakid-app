import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import logo from "./logo.png";

const HomePage = () => {
  useEffect(() => {
    document.title = "Home - SupaKid";
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col items-center p-6">
      {/* Logo and Header */}
      <div className="text-center mb-8">
        <img src={logo} alt="App Logo" className="w-32 h-auto mx-auto mb-4" />
        <h1 className="text-4xl font-extrabold text-gray-800">Welcome to SupaKid</h1>
        <p className="text-lg text-gray-600 mt-4 max-w-xl mx-auto">
          Empowering parents to create a safe, fun, and educational online experience for their children.
        </p>
      </div>

      {/* Main Buttons */}
      <div className="mt-8 text-center w-full">
        <h2 className="text-2xl font-bold text-gray-800 mb-6">Get Started</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 w-full max-w-lg mx-auto">
          <Link
            to="/"
            className="bg-blue-500 text-white py-3 rounded-lg shadow-md hover:bg-blue-600 transition text-lg text-center"
          >
            Child App
          </Link>
          <Link
            to="/settings"
            className="bg-green-500 text-white py-3 rounded-lg shadow-md hover:bg-green-600 transition text-lg text-center"
          >
            Parental setttings
          </Link>
        </div>
        <p className="text-lg text-gray-500 mt-6">
          Not signed up yet?{" "}
          <a
            href="https://forms.gle/sbzCa3JwhjMUVNQWA"
            target="_blank"
            rel="noopener noreferrer"
            className="text-blue-500 underline"
          >
            Register here
          </a>{" "}
          or call{" "}
          <a href="tel:7653511316" className="text-blue-500 underline">
            765-351-1316
          </a>.
        </p>
      </div>
    </div>
  );
};

export default HomePage;
