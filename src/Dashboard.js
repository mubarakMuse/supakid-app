import React from "react";

const Dashboard = ({ onSelectOption }) => {
  return (
    <div className="min-h-screen bg-gray-50 text-gray-800 flex flex-col items-center justify-center">
      <h1 className="text-3xl font-bold mb-6">Welcome to SupaKid</h1>
      <p className="text-lg mb-8">Choose an option for your child:</p>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
        <button
          className="bg-red-500 text-white px-6 py-4 rounded-lg shadow hover:bg-red-600 transition"
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
