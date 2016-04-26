## <a name="resource-user">User Parameter</a>

Stability: `prototype`

mmemberのスキーマを定義

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **id** | *integer* | unique identifier of user | `1` |
| **service** | *nullable integer* | どのツールか | `null` |
| **user** | *array* |  |  |

### User Parameter Create

user_session

```
POST /users/sign_in
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users/sign_in \
  -d '{
  "authenticity_token": "example",
  "user": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Create

user_password

```
POST /users/password
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users/password \
  -d '{
  "authenticity_token": "example",
  "user": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Update

edit_user_password update

```
PATCH /users/password
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PATCH /users/password \
  -d '{
  "authenticity_token": "example",
  "user": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Update

edit_user_password update

```
PUT /users/password
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PUT /users/password \
  -d '{
  "authenticity_token": "example",
  "user": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Create

user_registration create

```
POST /users
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |
| **service** | *nullable integer* | どのツールか | `null` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users \
  -d '{
  "authenticity_token": "example",
  "user": null,
  "service": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Update

edit_user_registration update

```
PATCH /users
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PATCH /users \
  -d '{
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```

### User Parameter Update

edit_user_registration update

```
PUT /users
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PUT /users \
  -d '{
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "authenticity_token": "example",
  "user": null,
  "commit": "メールアドレス変更",
  "service": null
}
```
