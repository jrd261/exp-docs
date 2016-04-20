---
permalink: /developers/network/
title: The EXP Network
keywords: network
---

# Overview

The EXP network faciliates real time communication between devices on the EXP platform. Messaging takes place though multicast broadcasting.

Broadcasts contain a name and JSON serializable payload. A broadcast is sent on a specified [channel](#channels). Devices can listen on channels for broadcasts with some specified name, take action upon receiving a broadcast given the broadcast payload, and respond to the broadcast with a JSON serializable response payload. The broadcaster in turn receives a JSON array of response payloads.


# Channels

Channels provide namespacing for messaging and help reduce network traffic by routing broadcasts to only devices that are actively listening on the given channel.

In addition to a channel name, channels have two flags `system` and `consumer`. The channel name can be any string. The full channel is defined by the combination of the organization, channel name, and these two flags. Channels with the same name, but different flags are **NOT** the same channel.

Broadcasts sent directly by EXP system will always be on `system` channels. Users cannot emit a broadcast on a `system` channel.

As consumer app credentials are typically delivered with a mobile application to the consumer, messages from consumer apps should be treated with caution. For this reason, all broadcasts from consumer app devices can only be emitted on `consumer` channels. Consumer apps can also only listen for messages on `consumer` channels. This allows non-consumer devices to communicate freely on non-consumer channels without having to worry about abuse of consumer app credentials.


# Sending a Broadcast

The easiest way to use the EXP Network is with one of our SDKs, however, broadcasts can still be emitted with a simple HTTP request. Sending a broadcast is as simple as sending a HTTP POST to `/api/networks/current/broadcasts`.

```javascript
{
  "name": "myEventName",
  "payload": {
    "anything": 2,
    "anything2": ["hi!"]
  },
  "channel": {
    "name": "myChannelName",
    "consumer": true
  }
}
```

The broadcast is made up of 3 components, the channel, the message name, and the message payload. In this case the consumer flag is set.

The response to the HTTP request is a list of response payloads that were received while the HTTP request was open.

To specify the amount of wait for responses, add a `timeout` query parameter to the broadcast, specifying the number of milliseconds to wait for responses to the broadcast: i.e. `/api/networks/current/broadcasts?timeout=5000`. The HTTP request will be kept open for approximately the given timeout.