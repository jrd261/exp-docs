
# Overview

Authentication is EXP is performed by sending a token along with each HTTP request. To get a token you can either supply credentials to the `/api/auth/login` endpoint, or exchange your token for a new one at the `/api/auth/token` endpoint.

## Making an Authenticated Request

To make an authenticated request, use supply your authentication token in the `Authorization` header as a `Bearer`, i.e.

```
Authorization: Bearer [token]
```




# Read Only Tokens


# Login Response


# Logging In

To obtain an authentication token, you must send a POST request to ```/api/auth/login``` with a JSON payload containing your login credentials. There are three different types of login credentials:
- User
- Device
- Consumer App

## Supplying User Credentials

User's must supply their `username` and `password`. If no `organization` is specified, the most recently used organization will be automatically chosen.

```json
{
  "username": "[username]",
  "password": "[password]",
  "organization": "[organization] (optional)"
}
```


## Supplying Device Credentials

Device's must supply a `type` field of `device`, and a JWT containing their `uuid`, signed by their `secret`. See [jwt.io](http://jwt.io).

```json
{
  "type": "device",
  "token": "[Signed JWT]"
}
```


## Supplying Consumer App Credentials

Consumer apps must supply a `type` field of `consumerApp` and a JWT containing their consumer app `uuid`, signed by their consumer app `api key`. See [jwt.io](http://jwt.io).

```json
{
  "type": "consumerApp",
  "token": "[Signed JWT]"
}
```

## Login Response

The login response payload is a JSON object, i.e:

```json
{
  "api": {
    "host": "https://goexp.io"
  },
  "network": {
    "host": "https://network-27.goexp.io"
  },
  "identity": {
    "type": "user",
    "organization": "scala",
    "username": "testuser@email.com",
    "role": "owner",
    "connectionId": "ac2fc636-c04c-4842-a0d1-fe381ffdc665"
  },
  "token": "Ijoib3duZXIiLCJjb25uZWN0",
  "expiration": 1461110658536,
  "restrictedToken": "jE0NjExMDE2NTgsImV4c"
}

```

- api.host: The API server to use your token with.
- network.host: The EXP network server you are assigned to.
- identity: Information about who you are.
- token: Your bearer authentication token.
- expiration: The unix time in milliseconds when your token will expire.
- restrictedToken: A token that allows read only access to low security things like content delivery.



## Refreshing a Token
