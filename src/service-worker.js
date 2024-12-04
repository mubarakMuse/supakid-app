/* eslint-disable no-restricted-globals */
import { precacheAndRoute } from 'workbox-precaching';

// Precache assets from Workbox manifest
precacheAndRoute(self.__WB_MANIFEST);

// Optional: Add custom fetch handling (e.g., for runtime caching)
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
