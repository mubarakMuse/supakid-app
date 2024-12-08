import React from "react";

const Dashboard = ({ onSelectOption }) => {
  return (
    <div className="min-h-screen bg-white text-gray-900 flex flex-col items-center justify-center p-8">
      <h1 className="text-4xl font-extrabold mb-4">Welcome to SupaKid</h1>
      <p className="text-md mb-6 text-gray-600">Choose an option for your child:</p>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <button
          className="bg-blue-500 text-white px-8 py-3 rounded-lg shadow-md hover:bg-blue-600 transition duration-200"
          onClick={() => onSelectOption("youtube")}
        >
          Filter YouTube
        </button>
        <button
          className="bg-green-500 text-white px-6 py-4 rounded-lg shadow hover:bg-green-600 transition"
          disabled
        >
          Curated Games (Coming Soon)
        </button>
        <button
          className="bg-yellow-500 text-white px-6 py-4 rounded-lg shadow hover:bg-yellow-600 transition"
          disabled
        >
          Islamic Content (Coming Soon)
        </button>
        <button
          className="bg-purple-500 text-white px-6 py-4 rounded-lg shadow hover:bg-purple-600 transition"
          disabled
        >
          Quran Stories (Coming Soon)
        </button>
      </div>
    </div>
  );
};

export default Dashboard;
