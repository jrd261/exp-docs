---
permalink: /developers/tutorials/image-app
title: Player App Example: Image Viewer
keywords: developer
last_updated: April 20, 2016
tags: []
---

This example is a simple image player. It requires a single
configuration option, the source url of the image to play.

The load method puts the source url into the image element and returns
a promise that resolves when the image is loaded.

No play method is defined because images do not have a begining or end.


```html
<html>
  <head>
    <script src="main.js"></script>
  </head>
  <body><img id="image"></img></body>
</html>

```


```javascript

function load () {
  return new Promise(function (resolve) {
    var image = document.getElementById('image');
    image.onload = resolve;
    image.setAttribute('src', exp.app.config.src);
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
