---
permalink: /developers/reference/player-apps-sdk
title: Player App SDK Reference
keywords: developer
last_updated: April 20, 2016
tags: []
---

Player apps have access to the global window variable `exp`. `exp` is
a running instance of the javascript SDK with additional methods and
properties available specific to the player.

`exp` becomes available just before `load` is called and so is not
available immediately after the document `DOMContentLoaded` event or
window `load` event. See [the player app guide](/developers/guides/player-apps/index.md).


# Apps

**`exp.app`**

A reference to the current app.

**`app.config`**

The configuration for the app. Always an object.

```javascript

const myConfig = exp.app.config;
const myParentsConfig = exp.app.parent.config;

```

**`app.element`**

The DOM element wrapping the app.

```javascript

// hide yourself!
exp.app.element.style.visibility = 'hidden';

// make children translucent
exp.app.children.forEach(app => app.element.style.opacity = .5);

```

**`app.container`**

The DOM element the app element was bound to.

```javascript

// Launch an app in your container
options.container = exp.app.container;
exp.player.launch(options);

```

**`app.status`**

The current status of the app. One of `loading`, `ready`, `playing`, `finished`, or `unloading`.

```javascript

// Play the app if ready.
if (app.status === 'ready') {
  return app.play();
}

```

**`app.on(eventName, callback)`**

Register a callback to listen for app related events. The following events are emitted during the lifecylcle of an app.

- `playing`: The app has begun playback.
- `error`: The app has encountered an error.
- `finished`: Playback has finished.
- `unloaded`: The app was unloaded.

```javascript

app.on('error', () => { console.log('This is not good!'); });
app.on('finished', () => app.element.style.visibility = 'hidden';);

```

**`app.play()`**

Play the app. Returns a promise that resolves when playback is finished or rejects if playback was interrupted.

```javascript

// Launch an app and play it.
exp.player.launch(options).then(function (app) { app.play(); });

```


**`app.abort(error)`**

Stop playback and remove the app. Optionally pass in an `error` to indicate why playback was stopped.


```javascript

// Abort yourself.
exp.app.abort(new Error('Something awful happened and I had to stop.'));


```

**`app.parent`**

Returns the parent `app`. If there is no parent app, returns `null`.


**`app.children`**

Returns an array of all `apps` launched by the app.



# Player

**`exp.player.options.get(name)`**

Returns the player option with the given name.

**`exp.player.options.set(name, value)`**

Sets the player option with the given name to the given value. Note that only strings are supported and any non string values will be stringify or set to an empty string if falsey.

**`exp.player.options.save()`**

Permanently saves any options set manually. Returns a promise that resolves when the options were saved.

**`exp.player.launch(options)`**

Returns a promise to a new app. When the promise resolves, the app is
bound to the DOM and is ready for playback. See [Launch Options](#launch-options).

**`exp.player.restart()`**

Restart the player.



# Launch Options

Name | Type | Description
--- | --- | ---
template | string | The UUID of the app template to use.
name | string | (optional) The name of the app.
container | string or DOM Element | The ID of the DOM element in the parent document or the DOM element to load the app into. Defaults to the parent apps element.
config | object | Configuration options for the app.
minDuration | number | The minimum amount of time to play the app for if app doesn't hold playback.
maxDuration | number | The maximum amount of time to play an app that holds playback.
forever | boolean | Whether or not to auto restart the app. App will play immediately.
