## <a name="resource-jwt">JWT Parameter</a>

Stability: `prototype`

Json Web Tokenが返ってくることを定義

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT<br/> **pattern:** `(?-mix:\w\.+)` | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |

### JWT Parameter Create

user_session

```
POST /users/sign_in
```


#### Curl Example

```bash
$ curl -n -X POST /users/sign_in \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JWT Parameter Create

user_registration create

```
POST /users
```


#### Curl Example

```bash
$ curl -n -X POST /users \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```


