import React, { useState } from "react";
import { createClient } from "@supabase/supabase-js";
import logo from "./logo.png";

const supabaseUrl = process.env.REACT_APP_SUPABASE_URL;
const supabaseKey = process.env.REACT_APP_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const ParentView = () => {
  const [parentCode, setParentCode] = useState("");
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [parentData, setParentData] = useState(null);
  const [channels, setChannels] = useState([]);
  const [newChannelHandle, setNewChannelHandle] = useState("");

  const handleLogin = async () => {
    try {
      const { data, error } = await supabase
        .from("parent_settings")
        .select("*")
        .eq("parent_code", parentCode)
        .single();

      if (error || !data) {
        alert("Invalid Parent Code. Please try again.");
        return;
      }

      setIsAuthenticated(true);
      setParentData(data);
      setChannels(data.channels || []);
    } catch (err) {
      console.error("Error logging in:", err);
    }
  };

  const saveChannelsToDB = async (updatedChannels) => {
    try {
      const { error } = await supabase
        .from("parent_settings")
        .update({ channels: updatedChannels })
        .eq("id", parentData.id);

      if (error) {
        console.error("Error saving channels:", error);
        alert("Failed to update channels in the database.");
        return false;
      }
      return true;
    } catch (err) {
      console.error("Unexpected error saving channels:", err);
      return false;
    }
  };

  const addChannel = async () => {
    if (newChannelHandle.trim()) {
      const updatedChannels = [...channels, { handle: newChannelHandle, displayName: newChannelHandle }];
      const success = await saveChannelsToDB(updatedChannels);
      if (success) {
        setChannels(updatedChannels);
        setNewChannelHandle("");
        alert("Channel added successfully!");
      }
    } else {
      alert("Please provide a valid channel handle.");
    }
  };

  const removeChannel = async (handle) => {
    const updatedChannels = channels.filter((channel) => channel.handle !== handle);
    const success = await saveChannelsToDB(updatedChannels);
    if (success) {
      setChannels(updatedChannels);
      alert("Channel removed successfully!");
    }
  };

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-100 px-4">
        <div className="bg-white p-6 rounded shadow-md w-full max-w-sm">
          <img src={logo} alt="Logo" className="w-24 mx-auto mb-4" />
          <h1 className="text-xl font-bold mb-4 text-center">Parent Login</h1>
          <input
            type="password"
            placeholder="Enter Parent Code"
            className="w-full border border-gray-300 rounded px-4 py-2 mb-4"
            value={parentCode}
            onChange={(e) => setParentCode(e.target.value)}
          />
          <button
            className="bg-blue-500 text-white px-4 py-2 rounded-lg w-full hover:bg-blue-600 transition duration-300"
            onClick={handleLogin}
          >
            Login
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 p-4">
      <div className="bg-white p-6 rounded shadow-md max-w-4xl mx-auto">
        <h1 className="text-xl font-bold mb-4 text-gray-700">
          Welcome, {parentData.first_name} {parentData.last_name}!
        </h1>
        <h2 className="text-lg font-semibold mb-2 text-gray-600">Membership Information</h2>
        <ul className="bg-gray-100 p-4 rounded mb-6">
          <li>
            <strong>Child Code (app login):</strong> {parentData.child_code || "Not Set"}
          </li>
          <li>
            <strong>Membership Type:</strong> {parentData.membership_type || "Not Set"}
          </li>
          <li>
            <strong>Status:</strong> {parentData.membership_active ? "Active" : "Inactive"}
          </li>
          <li>
            <strong>Start Date:</strong>{" "}
            {parentData.membership_start
              ? new Date(parentData.membership_start).toLocaleDateString()
              : "Not Set"}
          </li>
          <li>
            <strong>End Date:</strong>{" "}
            {parentData.membership_end
              ? new Date(parentData.membership_end).toLocaleDateString()
              : "Not Set"}
          </li>
        </ul>
        <div className="mb-8 p-4 bg-yellow-100 rounded">
          <p className="text-yellow-800">
            To cancel your membership, please email{" "}
            <a
              href="mailto:mubarak@brightertunnel.com"
              className="underline text-blue-600 hover:text-blue-800"
            >
              mubarak@brightertunnel.com
            </a>
          </p>
        </div>

        <h2 className="text-lg font-semibold mb-2 text-gray-600">Approved Channels</h2>
        <ul className="space-y-2 mb-4">
          {channels.map((channel) => (
            <li
              key={channel.handle}
              className="flex justify-between items-center bg-gray-100 p-2 rounded"
            >
              <span className="text-gray-700">{channel.displayName}</span>
              <button
                className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 transition duration-300"
                onClick={() => removeChannel(channel.handle)}
              >
                Remove
              </button>
            </li>
          ))}
        </ul>

        <div className="flex gap-2 mb-6">
          <input
            type="text"
            placeholder="Channel Handle (e.g., @newchannel)"
            className="flex-1 border border-gray-300 rounded px-4 py-2"
            value={newChannelHandle}
            onChange={(e) => setNewChannelHandle(e.target.value)}
          />
          <button
            className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition duration-300"
            onClick={addChannel}
          >
            Add
          </button>
        </div>

        <a
          href="/"
          rel="noopener noreferrer"
          className="block text-center bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition duration-300"
        >
          Go to App
        </a>
      </div>
    </div>
  );
};

export default ParentView;
