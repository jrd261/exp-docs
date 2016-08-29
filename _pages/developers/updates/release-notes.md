---
permalink: /updates/release-notes
title: Release Notes
keywords: developer
tags: [updates]
---

## August 29, 2016 Release

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
