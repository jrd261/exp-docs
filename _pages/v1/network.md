# The EXP Network

## Overview

The EXP network faciliates real time communication between entities on EXP. Users, devices, and consumer apps can communicate with eachother in real time.

Messages are send in the form of "broadcasts" and "responses". 




# Channels

All messages on the EXP network are scoped by a named channel. Channel names can be any string. 

```javascript
// Javascript SDK
const channel = exp.getChannel('my@wesomeChannel');
```

# Broadcasts

A broadcast is made up of 3 user supplied components, the channel, the message name, and the message payload. An additional component, the message id is added by EXP to track the message.







A broadcast is a message sent over the EXP network. Broadcasts can be received by more than one devices that have opted to listen for 

. Those devices can respond to the broadcast 


## Listening for Broadcasts

To listen for a broadcast, the device must have a socket connection to the EXP network. This is most easily accomplished 




# Advanced Topics

## Generating a Channel ID

## Network Servers
### Authentication
### Subscriptions

