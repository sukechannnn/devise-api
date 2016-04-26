## <a name="resource-user">User Parameter</a>

Stability: `prototype`

mmemberのスキーマを定義

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **id** | *integer* | unique identifier of user | `1` |
| **service** | *nullable integer* | どのツールか | `1` |
| **user** | *array* |  |  |

### User Parameter Create

user_session

```
POST /users/sign_in
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users/sign_in \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PATCH /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PUT /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |
| **service** | *nullable integer* | どのツールか | `1` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X POST /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "service": 1
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PATCH /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **user** | *array* |  |  |


#### Curl Example

```bash
$ curl -n -X PUT /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
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
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": null,
  "commit": "メールアドレス変更",
  "service": 1
}
```


