---
permalink: /developers/tutorials/video-app
title: Player App Example: Video Player
keywords: developer
last_updated: April 20, 2016
tags: []
---

This example is a simple video player. It requires a single
configuration option, the source url of the video to play.

The load method puts the source url into the video element and returns
a promise that resolves when the video is ready to play.

The play method returns a promise that resolves when the video has
finished playing.

```html
<html>
  <head>
    <script src="main.js"></script>
  </head>
  <body><video id="video"></video></body>
</html>

```


```javascript

function load () {
  console.debug('App is now loading.');
  return new Promise(function (resolve) {
    var video = document.getElementById('video');
    video.oncanplay = resolve;
    video.setAttribute('src', exp.app.config.src);
  });
}


function play () {
  return new Promise(function (resolve) {
    var video = document.getElementById('video');
    video.onended = resolve;
    video.play();
  });
}


```

Once this app is uploaded to EXP and can be referenced by uuid, any player app in your organization can launch a video by url by simply calling:

```javascript

var options = { template: '[uuid]', config: { url: '[url]' }
exp.player.launch(options).then(function (app) {
    app.play().then(function () { console.log('The video is finished!'); });
});


```

An interesting exercise would be to add the ability to configure the
video to play multiple times, or loop.

Another interesting exercise would be to write an app that plays a
series of video apps with different urls, i.e. a video slideshow.
