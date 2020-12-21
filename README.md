# User module

This module provides the user management and access control system for Feather CMS.

## Installation

You can use the Swift Package Manager to integrate this module.

```
// add to your dependencies 
.package(url: "https://github.com/FeatherCMS/user-module", from: "1.0.0-beta"),

// add to your target
.product(name: "UserModule", package: "user-module"),
```

## User module hooks

### user-permission-install

You can add your own permission properties by implementing the user permission install hook.

```
app.hooks.register("user-permission-install", use: userPermissionInstallHook)

func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
    [some]Module.permissions + 
    [some]Model.permissions +
    [
        [
            "module": "[module-name]",
            "context": "[custom-context]",
            "action": "[custom-action]",
            "name": "[custom-name]",
        ],
    ]
}
```

## User Module API

### Authentication

```sh
# login
curl -X POST \
-H "Content-Type: application/json" \
-d '{"email": "root@feathercms.com", "password": "FeatherCMS"}' \
"http://localhost:8080/api/user/login/"
```
The response is a `UserTokenObject`, you can use the token value from the response as a `Bearer` token or a `vapor-session` cookie to perform authenticated API calls.

cURL header value examples: 
- using the session cookie: `-H "Cookie: vapor-session=[session]"`
- using the API token value: `-H "Authorization: Bearer [token]"`

### Users

```sh
# list
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/users/"

# get
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/users/[id]/"

# create
curl -X POST \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"email": "user@feathercms.com", "password": "ChangeMe1"}' \
"http://localhost:8080/api/user/users/"

# update
curl -X PUT \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"email": "user@feathercms.com", "password": "ChangeMe1", "root": false}' \
"http://localhost:8080/api/user/users/[id]/"

# patch
curl -X PATCH \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"root": "false"}' \
"http://localhost:8080/api/user/users/[id]/"

# delete
curl -X DELETE \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/users/[id]/"
```

### Roles

```sh
# list
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/roles/"

# get
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/roles/[id]/"

# create
curl -X POST \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/roles/"

# update
curl -X PUT \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/roles/[id]/"

# patch
curl -X PATCH \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/roles/[id]/"

# delete
curl -X DELETE \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/roles/[id]/"
```

### Permissions

```sh
# list
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/permissions/"

# get
curl -X GET \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/permissions/[id]/"

# create
curl -X POST \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/permissions/"

# update
curl -X PUT \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/permissions/[id]/"

# patch
curl -X PATCH \
-H "Authorization: Bearer [token]" \
-H "Content-Type: application/json" \
-d '{"key": ""}' \
"http://localhost:8080/api/user/permissions/[id]/"

# delete
curl -X DELETE \
-H "Authorization: Bearer [token]" \
"http://localhost:8080/api/user/permissions/[id]/"
```
