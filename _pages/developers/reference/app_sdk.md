---
permalink: /developers/reference/app-sdk
title: App SDK Reference
keywords: developer
last_updated: April 20, 2016
tags: []
---


# Player SDK Reference


# Apps

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
exp.app.children.forEach(child => child.element.style.opacity = .5);

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

Register a callback to listen for app related events. The following events are emitted during the lifecylce of an app.

- `playing`
- `error`
- `finished`
- `unloaded`

```javascript

app.on('error', () => { console.log('This is not good!'); });
app.on('finished', () => app.element.style.visibility = 'hidden';);

```


**`app.play()`**

Play the app. Returns a promise that resolves when playback is finished or rejects when playback was interrupted.

```javascript

// Launch an app and play it.
exp.player.launch(options).then(app => app.play());

```


**`app.abort(error, force)`**

Stop playback and remove the app. Optionally pass in an `error` to indicate why playback was stopped. Apps can abort themselves. Set `force=True` to stop an app that was configured to play forever.

```javascript

// Abort yourself.
exp.app.abort(new Error('Something awful happened and I had to stop.'));

// Kill all your children, even those supposed to be running forever
exp.app.children.forEach(child => child.abort(null, true));


```


**`app.parent`**

Returns the parent `app`. If there is no parent app, returns `null`.


**`app.children`**

Returns an array of all `apps` launched by the app.




# Player Options

**`exp.player.options.get(name)`**

Returns the player option with the given name.

**`exp.player.options.set(name, value)`**

Sets the player option with the given name to the given value. Note that only strings are supported and any non string values will be stringify or set to an empty string if falsey.

**`exp.player.options.save()`**

Permanently saves any options set manually. Returns a promise that resolves when the options were saved.


# Launching Other Apps

**`exp.player.launch(options)`**

Returns a promise to a new app. When the promise resolves, the app is bound to the DOM and is ready for playback. If `forever` was specified, the new app will automatically be played, otherwise play will need to be called manually.

Name | Type | Description
--- | --- | ---
template | string | The UUID of the app template to use.
name | string | (optional) The name of the app.
container | string or DOM Element | The ID of the DOM element in the parent document or the DOM element to load the app into. Defaults to the parent apps element.
config | object | Configuration options for the app.
minDuration | number | The minimum amount of time to play the app for if app doesn't hold playback.
maxDuration | number | The maximum amount of time to play an app that holds playback.
forever | boolean | Whether or not to auto restart the app. App will play immediately.


**`exp.player.restart(error)`**
# exp.player

# exp.app
