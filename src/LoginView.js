import React, { useState } from "react";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.REACT_APP_SUPABASE_URL;
const supabaseKey = process.env.REACT_APP_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const LoginView = ({ onLogin }) => {
  const [childCode, setChildCode] = useState("");
  const [error, setError] = useState("");

  const handleLogin = async () => {
    try {
      const { data, error } = await supabase
        .from("parent_settings")
        .select("channels")
        .eq("child_code", childCode)
        .single();

      if (error || !data) {
        setError("Invalid child code. Please try again.");
        return;
      }

      onLogin(childCode, data.channels || []);
    } catch (err) {
      setError("An unexpected error occurred. Please try again.");
      console.error(err);
    }
  };

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center">
      <h1 className="text-2xl font-bold mb-6">Login to SupaKid</h1>
      <input
        type="text"
        placeholder="Enter Child Code"
        className="w-64 px-4 py-2 border rounded-lg mb-4"
        value={childCode}
        onChange={(e) => setChildCode(e.target.value)}
      />
      <button
        className="bg-green-500 text-white px-6 py-3 rounded-lg hover:bg-green-600"
        onClick={handleLogin}
      >
        Login
      </button>
      {error && <p className="text-red-500 mt-4">{error}</p>}
    </div>
  );
};

export default LoginView;
