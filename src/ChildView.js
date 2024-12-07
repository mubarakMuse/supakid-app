/* eslint-disable no-unused-vars */
import React, { useState } from "react";
import LoginView from "./LoginView";
import Dashboard from "./Dashboard";
import YouTubeView from "./YouTubeView";

const ChildView = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [childCode, setChildCode] = useState("");
  const [channels, setChannels] = useState([]);
  const [selectedChannel, setSelectedChannel] = useState(null);
  const [selectedOption, setSelectedOption] = useState("dashboard"); // 'dashboard', 'youtube', etc.

  const handleLogin = (code, approvedChannels) => {
    setChildCode(code);
    setChannels(approvedChannels);
    setSelectedChannel(approvedChannels[0]?.handle || null);
    setIsLoggedIn(true);
  };

  const handleOptionSelection = (option) => {
    setSelectedOption(option);
  };

  if (!isLoggedIn) {
    return <LoginView onLogin={handleLogin} />;
  }

  if (selectedOption === "youtube") {
    return (
      <YouTubeView
        channels={channels}
        selectedChannel={selectedChannel}
        setSelectedChannel={setSelectedChannel}
      />
    );
  }

  return <Dashboard onSelectOption={handleOptionSelection} />;
};

export default ChildView;
