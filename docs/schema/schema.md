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
| **authenticity_token** | *string* | 認証トークン | `"efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8="` |
| **commit** | *string* | commit | `"メールアドレス変更"` |
| **email** | *email* | email address | `"email@example.com"` |
| **id** | *integer* | unique identifier of user | `1` |
| **password** | *string* | password | `"nfho084j"` |
| **password_confirmation** | *string* | password confirmation | `"nfho084j"` |
| **remember_me** | *string* | ログイン記憶 | `0` |
| **service** | *nullable integer* | どのツールか | `1` |
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |

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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X POST /users/sign_in \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X POST /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X PATCH /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X PUT /users/password \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X POST /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X PATCH /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
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
| **user** | *array* | ユーザー情報の配列 | `"{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}"` |


#### Curl Example

```bash
$ curl -n -X PUT /users \
  -d '{
  "authenticity_token": "efDkcanZLLCduSjzF81mrjzsFOLRZoQcWnwyJV9Vuy8=",
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
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
  "user": "{\"email\"=>\"email@example.com\", \"password\"=>\"[FILTERED]\", \"remember_me\"=>\"0\"}",
  "email": "email@example.com",
  "password": "nfho084j",
  "password_confirmation": "nfho084j",
  "remember_me": 0,
  "commit": "メールアドレス変更",
  "service": 1
}
```


