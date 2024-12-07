/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */

import React, { useState, useEffect } from "react";

const CACHE_EXPIRY = 24 * 60 * 60 * 1000; // Cache expiry in milliseconds (1 day)

const YouTubeView = ({ channels, selectedChannel, setSelectedChannel }) => {
  const [videos, setVideos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [fullscreen, setFullscreen] = useState(false);
  const [currentVideoId, setCurrentVideoId] = useState(null);
  const [player, setPlayer] = useState(null);

  const fetchVideosByHandle = async (handle) => {
    try {
      const CACHE_KEY = `youtubeChannelVideos_${handle}`;
      const cachedData = localStorage.getItem(CACHE_KEY);

      if (cachedData) {
        const { videos, timestamp } = JSON.parse(cachedData);
        if (Date.now() - timestamp < CACHE_EXPIRY) {
          setVideos(videos);
          setLoading(false);
          return;
        }
      }

      const handleResponse = await fetch(
        `https://www.googleapis.com/youtube/v3/search?key=${process.env.REACT_APP_YOUTUBE_API_KEY}&q=${handle}&type=channel&part=snippet`
      );
      const handleData = await handleResponse.json();
      if (!handleData.items || handleData.items.length === 0) {
        console.error("No channel found for this handle:", handle);
        setLoading(false);
        return;
      }

      const channelId = handleData.items[0].id.channelId;
      const videosResponse = await fetch(
        `https://www.googleapis.com/youtube/v3/search?key=${process.env.REACT_APP_YOUTUBE_API_KEY}&channelId=${channelId}&type=video&part=snippet&maxResults=30`
      );
      const videosData = await videosResponse.json();
      setVideos(videosData.items);

      localStorage.setItem(
        CACHE_KEY,
        JSON.stringify({ videos: videosData.items, timestamp: Date.now() })
      );
    } catch (error) {
      console.error("Error fetching YouTube videos:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (selectedChannel) {
      setLoading(true);
      fetchVideosByHandle(selectedChannel);
    }
  }, [selectedChannel]);

  const initializePlayer = () => {
    if (currentVideoId) {
      const iframePlayer = new window.YT.Player("fullscreen-video", {
        videoId: currentVideoId,
        playerVars: {
          modestbranding: 1,
          controls: 0,
          rel: 0,
          disablekb: 1,
          fs: 0,
          autoplay: 1,
        },
        events: {
          onReady: (event) => setPlayer(event.target),
          onStateChange: (event) => {
            if (event.data === window.YT.PlayerState.ENDED) {
              exitFullscreen();
            }
          },
        },
      });
    }
  };

  useEffect(() => {
    if (window.YT && window.YT.Player) {
      initializePlayer();
    } else {
      window.onYouTubeIframeAPIReady = initializePlayer;
    }

    return () => {
      if (player) {
        try {
          player.stopVideo();
          player.destroy();
        } catch (error) {
          console.error("Error cleaning up the player:", error);
        }
        setPlayer(null);
      }
    };
  }, [currentVideoId]);

  const playFullscreen = (videoId) => {
    setCurrentVideoId(videoId);
    setFullscreen(true);
  };

  const exitFullscreen = () => {
    if (player) {
      try {
        player.stopVideo();
        player.destroy();
        setPlayer(null);
      } catch (error) {
        console.error("Error stopping or destroying the player:", error);
      }
    }
    setFullscreen(false);
  };

  return (
    <div className="min-h-screen bg-gray-50 text-gray-800">
      <div className="container mx-auto p-4">
        {!fullscreen && (
          <div className="mb-4">
            <label className="block text-lg font-semibold mb-2">Select Your Favorite Channel</label>
            <select
              className="w-full border border-gray-300 rounded px-4 py-2 text-lg"
              value={selectedChannel}
              onChange={(e) => setSelectedChannel(e.target.value)}
            >
              {channels.map((channel) => (
                <option key={channel.handle} value={channel.handle}>
                  {channel.displayName}
                </option>
              ))}
            </select>
          </div>
        )}

        {loading ? (
          <p className="text-lg">Loading videos...</p>
        ) : fullscreen ? (
          <div className="fixed inset-0 bg-black z-50 flex flex-col justify-center items-center">
            <div id="fullscreen-video" className="w-full h-full" style={{ pointerEvents: "none" }}></div>
            <div className="absolute inset-0 flex justify-center items-end mb-6">
              <div className="space-x-4">
                <button
                  onClick={() => player?.playVideo()}
                  className="bg-green-500 text-white px-4 py-2 rounded-lg shadow-lg hover:bg-green-600 transition duration-300"
                >
                  Play
                </button>
                <button
                  onClick={() => player?.pauseVideo()}
                  className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-lg hover:bg-blue-600 transition duration-300"
                >
                  Pause
                </button>
                <button
                  onClick={exitFullscreen}
                  className="bg-red-500 text-white px-4 py-2 rounded-lg shadow-lg hover:bg-red-600 transition duration-300"
                >
                  Exit
                </button>
              </div>
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {videos.map((video) => (
              <div
                key={video.id.videoId}
                className="bg-white p-4 rounded-lg shadow-lg cursor-pointer hover:shadow-xl transition-shadow"
                onClick={() => playFullscreen(video.id.videoId)}
              >
                <img
                  src={video.snippet.thumbnails.high.url}
                  alt={video.snippet.title}
                  className="w-full h-48 object-cover rounded"
                />
                <h3 className="text-center mt-2 text-lg font-semibold">{video.snippet.title}</h3>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default YouTubeView;
