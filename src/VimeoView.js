import React, { useState, useEffect } from "react";

const VimeoView = () => {
  const [videos, setVideos] = useState([
    { id: "1035083688", hash: "8fa75ae898", title: "Hana and omar" },
    // { id: "123456789", hash: "abcdef1234", title: "Sample Video 2" },
    // { id: "987654321", hash: "ghijk56789", title: "Sample Video 3" },
  ]);
  const [selectedVideo, setSelectedVideo] = useState(videos[0].id);

  useEffect(() => {
    document.title = "Vimeo Videos - SupaKid";
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 text-gray-800">
      <div className="container mx-auto p-4">
        <h1 className="text-3xl font-bold text-center mb-6">Custom Videos</h1>
        <p className="text-center text-lg text-gray-600 mb-8">
          Explore fun and educational videos curated just for you!
        </p>

        {/* Video Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {videos.map((video) => (
            <div key={video.id} className="bg-white rounded-lg shadow-lg overflow-hidden">
              <iframe
                src={`https://player.vimeo.com/video/${video.id}?h=${video.hash}&autoplay=0&title=0&byline=0&portrait=0`}
                width="100%"
                height="240"
                frameBorder="0"
                allow="autoplay; fullscreen"
                allowFullScreen
                title={video.title}
                className="w-full"
              ></iframe>
              <div className="p-4">
                <h2 className="text-lg font-bold text-gray-800">{video.title}</h2>
                <p className="text-sm text-gray-600 mt-2">Enjoy safe and engaging content.</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default VimeoView;
