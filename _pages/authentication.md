
# Overview

EXP uses token based authentication. To obtain a token you can [supply credentials](#exchanging-credentials-for-a-token) in an HTTP POST to the `/api/auth/login` endpoint, or if you already have a valid token, you can [create a new token](#refreshing-a-token) by sending an authenticated HTTP POST request to `/api/auth/token`.





# Exchanging Credentials for a Token

To obtain an authentication token, you must send a POST request to ```/api/auth/login``` with a JSON payload containing your login credentials. If successful, the response will be a [authentication response payload](#authentication-response-payload).

## User Credentials

User's must supply their `username` and `password`. If no `organization` is specified, the most recently used organization will be automatically chosen.

```json
{
  "username": "[username]",
  "password": "[password]",
  "organization": "[organization] (optional)"
}
```


## Device Credentials

Device's must supply a `type` field of `device`, and a JWT containing their `uuid`, signed by their `secret`. See [jwt.io](http://jwt.io).

```json
{
  "type": "device",
  "token": "[Signed JWT]"
}
```


## Consumer App Credentials

Consumer apps must supply a `type` field of `consumerApp` and a JWT containing their consumer app `uuid`, signed by their consumer app `api key`. See [jwt.io](http://jwt.io).

```json
{
  "type": "consumerApp",
  "token": "[Signed JWT]"
}
```




# Refreshing a Token

To refresh your token, simply send an authenticated HTTP POST request to `/api/auth/token'. You should receive a [authentication payload](#authentication-payload-response) if your token is valid.



# Making an Authenticated Request

To make an authenticated request, supply your authentication token in the `Authorization` header of the HTTP request, i.e.

```
Authorization: Bearer [token]
```







# Authentication Response Payload

The authentication response payload is a JSON object containing various information.

- api.host: The API server to use your token with.
- network.host: The EXP network server you are assigned to.
- identity: Information about who you are.
- token: Your bearer authentication token.
- expiration: The unix time in milliseconds when your token will expire.
- restrictedToken: A token that allows read only access to low security things like content delivery.

Here is an example response payload:

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
