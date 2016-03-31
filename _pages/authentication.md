

EXP uses token based authentication .

## Authentication Lifecycle

All authentication tokens have an expiration. When the expiration date is reached that token can no longer be used. A non-expired token can be used to obtain a new 

An authentication token can be ge

Authentication Bearer [TOKEN]

## Token Exchange

Sending an 

## Logging In

To obtain an authentication token, you must send a POST request to /api/auth/login with a JSON payload containing your login credentials.
There are three different types of login credentials:
- User
- Device
- Consumer App

### User Credentials

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

Consumer apps must supply a `type` field of `consumerApp` and a JWT container a 
## Refreshing a Token
