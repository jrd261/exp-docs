---
permalink: /developers/
title: Developer Guide
keywords: developer
last_updated: November 30, 2015
tags: [getting_started]
summary: "A guide for developers using the EXP platform."
---

# Getting Started With App Development

## Essential Concepts of an EXP Player App

### It consists of HTML, CSS, Javscript and a configuration file
Your app consists of a zipped directory of one or more files, the most important of which is the `index.html`.
When the app is scheduled to be played in an EXP player, the `index.html` will be displayed on the player, with any
styles or script tags included in the index file also being loaded as you would expect.

### Communication with EXP is through the Javascript SDK
The EXP Javascript SDK is available on the `window` object to be used by your javascript. It will be used to get
dynamic content and broadcast events to other devices in the experience.

### Explicit authentication is unnecessary
When an app using the Javascript SDK is running inside of a player, it already has been authenticated by the player
pairing process. This is in contrast to non-player apps which must use `exp.start()` to join the EXP network.

### Life begins at `load()`
Whereas most javascript applications start themselves through `document.onload` or some similar event that the browser
sends out, most EXP apps structure themselves around the `load()` and `play()` functions, which will be run for
you by the player at the appropriate times.

### It has dynamic configuration
Your app can be written to be flexible about its content. For instance, in a slideshow app the images and videos are not
part of the app itself, but configured from the EXP UI after the app has been added to an experience. Your app will
indicate what configuration options it will have through its `manifest.json` file, which is explained more in the
Hello World example.


## Hello World for EXP Player Apps
There are two alternatives to get started with a new app:

* Create a directory in your own development environment with `index.html` at the root

* Navigate to the content route in EXP and choose `New > New App`. This will let you edit the files in an in-browser editor

### 1. Show some HTML on the screen
First we'll show some boring static content. If you created the app using the EXP UI then the following `index.html` was already created.
If you are creating it in your own environment then copy and paste the following into your `index.html`.

    <!DOCTYPE html>
    <html>
      <head>
        <link href='//fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
        <style>
          html { font-family: 'Roboto', sans-serif; color: #7E57C2; background-color: #FFF }
        </style>
      </head>
      <body>
        <h1>Let's get started!</h1>
      </body>
    </html>

Read [here]() for more information about setting up a player and assigning an app. If all has gone well you should see something like

![index.html](/common_images/developers/letsgetstarted.png)

### 2. Verifying a connection to EXP
Communication with EXP is through the `exp` object which is already available on the window object. Besides this object,
the other bit of "magic" that comes from being in an EXP player is that you must define `load()` and `play()` functions
on the global scope. To demonstrate this, copy the following code into a javascript file or script tag included in your app.

    'use strict';

    function play() {
      var deviceUuid = exp.auth.identity.uuid;

      exp.getDevice(deviceUuid).then(function(device) {
        device = device.document;

        console.log(device.name);
        console.log(device.uuid);
      });
    }

Running this in a player should result in the player name and uuid being logged in console. This example demonstrates how
configuration information is available on the `exp.auth` object, and how to use an asynchronous call like `getDevice()` to
EXP. Note that `getDevice()` returns a javascript promise rather than using a callback, as do many other methods in the EXP Javascript SDK. 

### 3. Getting content
To get some dynamic content into our app, we first have to create a `manifest.json` that will tell EXP to allow
configuration of the content from the UI. Create and copy the following into a `manifest.json` file in the root of
the app. *Note: replace "YOUR_APP_NAME" with the name you gave your own app*.

    {
      "name": "YOUR_APP_NAME",
      "configTypes": [{
        "name": "exampleImages",
        "type": "appArray",
        "label": "Some Example Images",
        "path": "exampleImages",
        "multiItem": true
      }],
      "config": {
        "slides": []
      }
    }

This will allow you to assign a number of images to instances of the app in the app settings page.

![app configuration](/common_images/developers/appconfiguration.png)

Next, we will display the first assigned image in the app. Add a div to the body of the app as a container for
exp to put the image in.

Finally, add some code to the `play()` function that will load the image array and play its first element in the
container div.

    var key = exp.app.config.exampleImages[0].key;
    var container = document.getElementById('image-container');

    exp.app.launch({
      key: key,
      container: container
    });

A couple of things to note about the above code:

* in this case the configuration was accessed as `exp.app.config.examplesImages`. The last part, `exampleImages` depends
    on the `key` property we set in the manifest.

* we pointed the `exp.app.launch()` function to a content key and a container in the dom. We didn't tell it what
    type of content to expect, it figures that out on its own. In this case it was an image but it could have been other
    types of content such as a video or even another app.

### Conclusion
If you refresh the player you should now be able to see your content front and center.

To learn more about what's possible with an EXP player app, read the documentation for the EXP Javascript SDK.

# SDK References

- [Python SDK Reference](../python_sdk_reference-1.0.0)
- [Javascript SDK Reference](../javascript_sdk_reference-1.0.0)


