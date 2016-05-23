---
permalink: /developers/reference/manifest/
title: Manifest.json Reference 
keywords: manifest
---

The `manifest.json` is an optional file that can be included in the root of your custom app.
Besides providing metadata about your app such as its name and how it will appear to users in the
EXP UI, the manifest's primary purpose is to specify how your app will be configured. For instance, if you want your
app to allow a custom message or image to be shown, you would put the appropriate lines in your `manifest.json`.

## Metadata options
These options affect how your app appears to users of the app who are configuring it through the EXP UI.

```json
{
  "name": "Example App",
  "icon": "pencil",
  "background": "grey",
  "description": "An app that's an example"
}
```

**`name`**
The name it will have in the UI.

**`icon`**
The icon it will have in the UI.

**`background`**
The background color it will have in the UI.

**`description`**
A short description of the purpose of the app.

## Content configuration
In addition to the metadata properties, there are the `configTypes` and `config` properties.

`configTypes` is an array of objects, each object standing for a different type of content that could be provided.

`config` is an object that serves as the "default" configuration object new instances of your app will have.

```json
{
  "name": "Example App",
  "configTypes": [
    {
      "name": "Message",
      "type": "text",
      "label": "message",
      "path": "userMessage",
      "required": false
    }
  ],
  "config": {
    "userMessage": "Default greeting message!"
  }
}
```

**`name`**
An optional field to help you, the developer, remember what the configuration object is for.

**`type`**
The type of value this is configuration for. The possible types of configuration objects are catalogued below.

**`label`**
The label that the field will have in the EXP UI.

**`path`**
The key or path this value will be stored at on the configuration object.

**`required`**
A boolean value (default `false`) which, if true, will not let the user save changes to the app config unless
the value is present.

**`multiItem`**
A boolean value which is true if you are allowing an array of content to be configured. For instance, in a slideshow
with multiple pieces of content in a row this would be true.

**`supportedTypes`**
For types like `feed` that have a subtype of acceptable values, this property is an array of types that can be assigned to the field.


### configType: text
A simple text message. Its value is a string and in the UI the user will edit it with a text input.

```json
{
  "configTypes": [
    {
      "name": "Message",
      "type": "text",
      "label": "message",
      "path": "userMessage",
      "required": false
    }
  ],
  "config": {
    "userMessage": "Default greeting message!"
  }
}
```

### configType: image
An image that the user can upload and will then be available to your app. The user can choose to upload a picture or choose one from the content tree.


```json
{
  "configTypes": [
    {
      "name": "Logo",
      "type": "image",
      "label": "Sidebar Logo",
      "path": "logo",
      "multiItem": false,
      "required": false
    }
  ],
  "config": {
  }
}
```

For types like image for which it doesn't make sense to have a default value, leave the value out of the `config` object.

### configType: feed
A feed of data that your app will be consumed. Feeds are configurable from the UI by users and can then be assigned to apps.

For this type, `supportedTypes` should be supplied with the type of feed you are expecting. Possible values include

* `"scala:feed:weather"`

* `"scala:feed:rss"`

* `"scala:feed:google"`

* `"scala:feed:outlook"`

* `"scala:feed:square"`

* `"scala:feed:shopify"`

* `"scala:feed:instagram"`

* `"scala:feed:facebook"`

* `"scala:feed:twitter"`

```json
{
  "configTypes": [
    {
      "name": "Weather Feed",
      "type": "feed",
      "label": "Weather Feed",
      "path": "weatherFeed",
      "required": true,
      "supportedTypes": [ "scala:feed:weather" ]
    }
  ],
  "config": {
  }
}
```

For types like feed for which it doesn't make sense to have a default value, leave the value out of the `config` object.

### configType: color
A color for the user to pick. Often used for letting them choose a theme for your app.

```json
{
  "configTypes": [
    {
      "name":"Trimary Color",
      "type":"color",
      "label":"Primary Color",
      "required":true,
      "path":"primaryColor"
    }
  ],
  "config": {
    "primaryColor": "#F5F5DC"
  }
}
```

### configType: select
This configuration object specifies the user be given a drop-down selection of different values. There should be an
additional config parameter supplied called `options` that lists the possible values and what they should be labeled.

```json
{
  "configTypes": [
    {
      "name":"Temperature",
      "type":"select",
      "label":"Temperature",
      "required":true,
      "path":"temperature",
      "options":[
        {
          "label":"Celsius",
          "value":"c"
        },
        {
          "label":"Fahrenheit",
          "value":"f"
        }
      ]
    }
  ],
  "config": {
    "temperature": "f"
  }
}
```

### configType: appArray
This configuration object declares the user will be able to configure a list of content items that are run in their apps within
your app. 

If you only want the user to be able to set one piece of content, use this object but set `multiItem` to `false`.

If you want to restrict the control so only certain types of content can be assigned, define a `restriction` param, which is an array
of permitted content types. Possible values that can be restricted to are:

* `"folder"`

* `"app"`


* `"image"`


* `"youtube"`


* `"url"`


* `"video"`


* `"pdf"`


* `"file"`


* `"composition"`


* `"audio"`


* `"vector"`


* `"code"`

```json
{
  "configTypes": [
    {
      "name": "Content",
      "type": "appArray",
      "label": "Content to Show",
      "required": true,
      "path": "content",
      "restriction": ["video", "image"]
    }
  ],
  "config": {
    "content": "[]"
  }
}
```
