---
permalink: /developers/guides/player-apps
title: Player Apps
keywords: developer
last_updated: April 20, 2016
tags: []
---


# Overview

A player app is an HTML5 web application. Unlike a traditional web
page, a player app might have a very narrow purpose, i.e. to play a
video, monitor other running apps, or just listen for and respond to
external events. An app can be a little as a microservice, or as big
as a full angular user interface. Here are the important concepts:

- Apps are just HTML5 web pages.
- Apps run inside iframes within the player.
- Many apps can be playing simultaneously.
- Apps can launch other apps, and manage and interact with other apps.
- Apps have access to a running instance of the Player App SDK which includes the Javascript SDK.


# Player App Lifecycle

## Summary

Apps travel through 5 states during their lifecycle:

- `loading`: The app is being loaded.
- `ready` : The app can begin playback immediately.
- `playing` : The app is playing.
- `finished` : The app has finished playback.
- `unloaded` : The app has been detached from the DOM. He's dead, Jim.

An app can bind `load`, `play`, and `unload` methods to the window to
control their lifecycle.


## Loading and `window.load()`

When the DOM of the app has been loaded, the player attaches the
Player App SDK to the window of the app.

The player will then look for a `load` method on the app's window. The
`load` method is then called if it exists.

If no load method is provided, the player will immediately move the
app into the `ready` state.

If the load method returns a promise, the player will hold the app in
the `loading` state until the promise has resolved. The expectation
for all apps is that once load is completed that playback can begin
immediately.


```javascript

window.load = function () {
  // Return a promise that resolves when I'm ready to play.
};

```

## Playback and `window.play()`

When an app has entered the `ready` state, `app.play()` tells
the player to transition the app into the `playing` state.

The player will then look in the app window for a `play` method. If a
`play` method is defined, it is called.

If there is no play method or the play method does not return a
promise, the app will remain in the `playing` state until the minimum
duration specified in the launch options is reached.

If the play method returns a promise, the player will play the app
until the promise is resolved/rejected or the maximum duration
specified in the launch options is reached.

When playback finishes, the player immediately transitions the app
into the `finished` state.


## Unloading: `window.unload()`

When an app enters the `finished` state, there is a short delay to
allow any visual transitions to resolve before the player transitions
the app into the `unloaded` state.

Just before detaching the app from the DOM, the player looks for an
`unload` method on the app window and calls it if it exists. Note that
unlike `load` and `play` unload must perform its actions syncrounsly.

The player will then detach the app from the DOM. A reference to an
`unloaded` app is just a useless remnant that should be discarded to
release any remaining memory footprint.


## Errors and Aborting

When an app is aborted, the player immediately unloads the app. Apps
can be manually aborted by calling `app.abort()`. If the `load()` and
`play()` methods throw an error or return a rejected promise, the app
will also be aborted.

```javascript

// All of these will cause the app to be aborted.

window.load = function () {
  throw new Error();
};

window.play = function () {
  return Promise.reject();
};

window.play = function () {
  exp.app.abort();
};

```


# Parent Child Relationships

When an app launches another app, a parent-child relationship is
formed between the two apps, regardless of whether or not that
relationship is mirrored in the DOM. If the parent is aborted, the
children are aborted as well.
