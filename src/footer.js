import React from "react";

const Footer = () => {
  return (
    <footer className="bg-gray-800 text-gray-300 py-6">
      <div className="container mx-auto text-center">
        {/* Links Section */}
        {/* <div className="flex justify-center space-x-6 mb-4">
          <a
            href="https://www.facebook.com"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-white transition"
          >
            Facebook
          </a>
          <a
            href="https://www.twitter.com"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-white transition"
          >
            Twitter
          </a>
          <a
            href="https://www.instagram.com"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-white transition"
          >
            Instagram
          </a>
          <a
            href="https://www.linkedin.com"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-white transition"
          >
            LinkedIn
          </a>
        </div> */}

        {/* Contact Information */}
        <p className="text-sm mb-4">
          Questions? Contact us at{" "}
          <a href="mailto:mubarak@brightertunnel.com" className="text-blue-400 hover:underline">
          mubarak@brightertunnel.com
          </a>
        </p>

        {/* Copyright */}
        <p className="text-sm">
          © {new Date().getFullYear()} SupaKid. All rights reserved.
        </p>
      </div>
    </footer>
  );
};

export default Footer;
