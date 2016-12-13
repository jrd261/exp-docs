---
permalink: /updates/release-notes
title: Release Notes
keywords: developer
tags: [updates]
---

## December 2016 Release

- Android SDK v1.0.6 [click here](https://github.com/ScalaInc/exp-android-sdk/releases/tag/v1.0.6).
  
  - Added Create,Delete,Upadte,Refresh to Exp model.

  - Added setProperty to Exp model.

- IOS SDK v1.0.6 [click here](https://github.com/ScalaInc/exp-ios-sdk/releases/tag/v1.0.6).
  
  - Added Create,Delete,Upadte,Refresh to Exp model.
  
  - Added setProperty to Exp model.


## November 2016 Release

- IOS SDK v1.0.5 [click here](https://github.com/ScalaInc/exp-ios-sdk/releases/tag/v1.0.5).
 
  - Added Swift 3.0 support if you're using previous version there are breaking changes.
 	
  - Added Sequencetype extension for SearchResults to iterate the response.

  - Updated all the project dependency to the latest stable release. 

- Android SDK v1.0.5 [click here](https://github.com/ScalaInc/exp-android-sdk/releases/tag/v1.0.5).

  - Added implements Iterable<T> for SearchResults to iterate the response.  

  - Updated all the project dependency to the latest stable release. 

## October 2016 Release

- Added a weekly schedule view

- Added Yammer to integrations

## September 2016 Release

- Meeting Room App

  - Now supports multi-day events

  - Now updates immediately when events become active

## August 2016 Release

- Javascript SDK v1.0.4

  - Added `total` fields on most query responses to support pagination.

  - Most queries now support filtering with query params.

  - Auth can now be passed directly into `EXP.start`

- Player updates

  - Apps now support `app.stop()` for graceful shutdown.

  - Can now add `window.stop` method to app `window`. Will be called when app is stopped but before its unloaded.

- Manifest.json

  - We now support Device, Thing and Location selection fields in app settings.

- Added LinkedIn [integration](/developers/guides/feeds/#integrations)

