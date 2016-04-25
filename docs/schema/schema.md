## <a name="resource-token">JSON Web Token for User Management</a>

Stability: `prototype`

ユーザー情報の入ったJWT

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |

### JSON Web Token for User Management New

new_user_session

```
GET /users/sign_in
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/sign_in
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management Destroy

destroy_user_session

```
GET /users/sign_out
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/sign_out
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management New

new_user_password

```
GET /users/password/new
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/password/new
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management Edit

edit_user_password

```
GET /users/password/edit
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/password/edit
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management Cancel

cancel_user_registration

```
GET /users/cancel
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/cancel
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management New

new_user_registration

```
GET /users/sign_up
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/sign_up
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```

### JSON Web Token for User Management Edit

edit_user_registration

```
GET /users/edit
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **token** | *string* | ユーザー情報の入ったJWT | `"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"` |



#### Curl Example

```bash
$ curl -n /users/edit
 -G \
  -d token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InRhbmFrYSIsInBhc3N3b3JkIjoiamF1MDMyOHVyYTBqcmRzZjMifQ.n6peT2Ji3muMwFuD-eoQnp-hbFW1VFO4I4XOzNm1GoSyUKKpT8EN3Ya56HTxqvmI8D9LX_4tNbAMC1qa2vGH_67_I7y7s_bLRMwntBaa1jhw7AmI2cniVNYWL4oFAdfSBBLAGhCKa5taB3WKeOwheVoh0fbWbpo9OALLvklExjKGYSpyz2O5HJZ-Qm0CHduMMw9ydsXWPmUoKj8WNodvCCIFU-9HKlS-55bMYP-AqzPXrofSrmfemRRyAnf9rnavyvPBCSFEakOfMEPbOAno58L18nepqllr6RRiIPLsLtKbGmgrqHsQyESndL_yxol8MFCGJTNu8Lgy7hBrhioX5g"
}
```


## <a name="resource-user">User Parameter</a>

Stability: `prototype`

mmemberのスキーマを定義

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **addr1** | *nullable string* | エリア1 | `null` |
| **addr2** | *nullable string* | エリア2 | `null` |
| **addr3** | *nullable string* | エリア3 | `null` |
| **basic_flg** | *nullable integer* | ベーシックのユーザーかどうか | `null` |
| **bmon** | *nullable integer* | 誕生月 | `null` |
| **byear** | *nullable integer* | 誕生年 | `null` |
| **confirmation_sent_at** | *nullable date-time* | DEVISE | `null` |
| **confirmation_token** | *nullable string* | DEVISE | `null` |
| **confirmed_at** | *nullable date-time* | DEVISE | `null` |
| **corporation** | *nullable string* | 会社名 | `null` |
| **created_at** | *date-time* | when user was created | `"2015-01-01T12:00:00Z"` |
| **current_sign_in_at** | *nullable date-time* | DEVISE | `null` |
| **current_sign_in_ip** | *nullable string* | DEVISE | `null` |
| **email1** | *nullable email* | email address | `null` |
| **email2** | *nullable email* | email address | `null` |
| **facebook_id** | *nullable string* | 新ferret facebookログイン | `null` |
| **id_facebook** | *nullable string* | 旧ferret facebook認証 | `null` |
| **id_twitter** | *nullable string* | 旧ferret twitter認証 | `null` |
| **job** | *nullable string* | 職業 | `null` |
| **last_login_date** | *date-time* | 最後にログインした日時 | `"2015-01-01T12:00:00Z"` |
| **last_sign_in_at** | *nullable date-time* | DEVISE | `null` |
| **last_sign_in_ip** | *nullable string* | DEVISE | `null` |
| **mail_magazine_flg** | *nullable string* | メルマガ可否 | `null` |
| **marry** | *nullable integer* | 結婚 | `null` |
| **memstate** | *nullable integer* | 会員か無効会員かどうか | `null` |
| **nname** | *nullable string* | unique name of user | `"Tanaka"` |
| **oauth** | *nullable string* | 認証 | `null` |
| **passwd** | *nullable string* | password | `null` |
| **ref** | *nullable integer* | 参考 | `null` |
| **regdate** | *nullable string* | 登録日 | `null` |
| **remember_created_at** | *nullable date-time* | DEVISE | `null` |
| **reset_password_sent_at** | *nullable date-time* | DEVISE | `null` |
| **reset_password_token** | *nullable string* | DEVISE | `null` |
| **service** | *nullable integer* | どのツールか | `null` |
| **sex** | *nullable integer* | 性別 | `null` |
| **sign_in_count** | *integer* | DEVISE | `42` |
| **twitter_id** | *nullable string* | 新ferret twitterログイン | `null` |
| **uid** | *integer* | unique identifier of user | `1` |
| **unconfirmed_email** | *nullable string* | DEVISE | `null` |
| **updated_at** | *date-time* | when user was updated | `"2015-01-01T12:00:00Z"` |
| **url1** | *nullable uri* | URL1 | `null` |
| **url2** | *nullable uri* | URL2 | `null` |
| **url3** | *nullable uri* | URL3 | `null` |
| **url4** | *nullable uri* | URL4 | `null` |
| **url5** | *nullable uri* | URL5 | `null` |
| **yahoojp_id** | *nullable string* | Yahooログイン | `null` |

### User Parameter Create

user_session

```
POST /users/sign_in
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email1** | *nullable email* | email address | `null` |
| **passwd** | *nullable string* | password | `null` |



#### Curl Example

```bash
$ curl -n -X POST /users/sign_in \
  -d '{
  "email1": "username@example.com",
  "passwd": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
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
| **passwd** | *nullable string* | password | `null` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email1** | *nullable email* | email address | `null` |


#### Curl Example

```bash
$ curl -n -X POST /users/password \
  -d '{
  "email1": "username@example.com",
  "passwd": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
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
| **passwd** | *nullable string* | password | `null` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email1** | *nullable email* | email address | `null` |


#### Curl Example

```bash
$ curl -n -X PATCH /users/password \
  -d '{
  "email1": "username@example.com",
  "passwd": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
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
| **passwd** | *nullable string* | password | `null` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email1** | *nullable email* | email address | `null` |


#### Curl Example

```bash
$ curl -n -X PUT /users/password \
  -d '{
  "email1": "username@example.com",
  "passwd": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### User Parameter Create

user_registration

```
POST /users
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email1** | *nullable email* | email address | `null` |
| **passwd** | *nullable string* | password | `null` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **service** | *nullable integer* | どのツールか | `null` |


#### Curl Example

```bash
$ curl -n -X POST /users \
  -d '{
  "email1": "username@example.com",
  "passwd": null,
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
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### User Parameter Update

edit_user_registration update

```
PATCH /users
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **addr1** | *nullable string* | エリア1 | `null` |
| **addr2** | *nullable string* | エリア2 | `null` |
| **addr3** | *nullable string* | エリア3 | `null` |
| **bmon** | *nullable integer* | 誕生月 | `null` |
| **byear** | *nullable integer* | 誕生年 | `null` |
| **corporation** | *nullable string* | 会社名 | `null` |
| **email1** | *nullable email* | email address | `null` |
| **job** | *nullable string* | 職業 | `null` |
| **marry** | *nullable integer* | 結婚 | `null` |
| **nname** | *nullable string* | unique name of user | `"Tanaka"` |
| **passwd** | *nullable string* | password | `null` |
| **ref** | *nullable integer* | 参考 | `null` |
| **sex** | *nullable integer* | 性別 | `null` |
| **uid** | *integer* | unique identifier of user | `1` |
| **url1** | *nullable uri* | URL1 | `null` |
| **url2** | *nullable uri* | URL2 | `null` |
| **url3** | *nullable uri* | URL3 | `null` |
| **url4** | *nullable uri* | URL4 | `null` |
| **url5** | *nullable uri* | URL5 | `null` |


#### Curl Example

```bash
$ curl -n -X PATCH /users \
  -d '{
  "uid": 1,
  "email1": "username@example.com",
  "passwd": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### User Parameter Update

edit_user_registration update

```
PUT /users
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **addr1** | *nullable string* | エリア1 | `null` |
| **addr2** | *nullable string* | エリア2 | `null` |
| **addr3** | *nullable string* | エリア3 | `null` |
| **bmon** | *nullable integer* | 誕生月 | `null` |
| **byear** | *nullable integer* | 誕生年 | `null` |
| **corporation** | *nullable string* | 会社名 | `null` |
| **email1** | *nullable email* | email address | `null` |
| **job** | *nullable string* | 職業 | `null` |
| **marry** | *nullable integer* | 結婚 | `null` |
| **nname** | *nullable string* | unique name of user | `"Tanaka"` |
| **passwd** | *nullable string* | password | `null` |
| **ref** | *nullable integer* | 参考 | `null` |
| **sex** | *nullable integer* | 性別 | `null` |
| **uid** | *integer* | unique identifier of user | `1` |
| **url1** | *nullable uri* | URL1 | `null` |
| **url2** | *nullable uri* | URL2 | `null` |
| **url3** | *nullable uri* | URL3 | `null` |
| **url4** | *nullable uri* | URL4 | `null` |
| **url5** | *nullable uri* | URL5 | `null` |


#### Curl Example

```bash
$ curl -n -X PUT /users \
  -d '{
  "uid": 1,
  "email1": "username@example.com",
  "passwd": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "uid": 1,
  "email1": "username@example.com",
  "email2": "username@example.com",
  "passwd": null,
  "memstate": null,
  "regdate": null,
  "nname": "Tanaka",
  "corporation": null,
  "byear": null,
  "bmon": null,
  "sex": null,
  "addr1": null,
  "addr2": null,
  "addr3": null,
  "job": null,
  "marry": null,
  "ref": null,
  "service": null,
  "url1": null,
  "url2": null,
  "url3": null,
  "url4": null,
  "url5": null,
  "last_login_date": "2015-01-01T12:00:00Z",
  "basic_flg": null,
  "oauth": null,
  "id_facebook": null,
  "id_twitter": null,
  "reset_password_token": null,
  "reset_password_sent_at": "2015-01-01T12:00:00Z",
  "remember_created_at": "2015-01-01T12:00:00Z",
  "sign_in_count": 42,
  "current_sign_in_at": "2015-01-01T12:00:00Z",
  "last_sign_in_at": "2015-01-01T12:00:00Z",
  "current_sign_in_ip": null,
  "last_sign_in_ip": null,
  "confirmation_token": null,
  "confirmed_at": "2015-01-01T12:00:00Z",
  "confirmation_sent_at": "2015-01-01T12:00:00Z",
  "unconfirmed_email": null,
  "facebook_id": null,
  "twitter_id": null,
  "yahoojp_id": null,
  "mail_magazine_flg": null,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


