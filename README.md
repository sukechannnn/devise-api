# Ferret Oauth API

## 概要
### 一般
- ユーザー登録周りを一括して担うapi
- 正しい認証またはログインのリクエストが飛んできたら、uid,email,有効期限を含むJWTを返す
- 正しくない場合は、正しくないということをjsonで返す
- 詳しくはrspecのテストを参照

## Doc
- 環境構築: https://github.com/basicinc/ferret-oauth-api-dev
- json-schemaドキュメント(未完成):  https://github.com/basicinc/ferret-oauth-api/blob/master/docs/schema/schema.md

## JWTについて

### 概要
- JWTはjsonをトークン化する仕組み
- 改ざん出来ないjson

### Signed JWT
- JWTがサポートしている署名アルゴリズム
  - HMAC : 共通鍵方式
  - RSA : 公開鍵方式
  - ECDSA : 楕円曲線暗号（多分使わない）
- ferret-oauth-apiではRSAを使用

### 運用
- 秘密鍵と公開鍵を作っておく
- 送りたいデータを秘密鍵でエンコードし、レスポンスとして返す
- 帰ってきたJWTをセッションに保存
- 受信側は公開鍵を使ってトークンをデコードし、必要なデータを取り出す
- 必要ならばトークンに有効期間を設けておく


### JWTの構造
JWTは３つのパートから成り、全てbase64urlエンコードされている。
この３つのパートをドット(.)で繋げたものがJWTである

#### 各パートについて

Header : このパラメータがJWTであることや、署名アルゴリズムを示す

```Header
{"typ":"JWT", "alg":"HS256"}

エンコード後
eyJ0eXAiOiJKV1QiLA0KICJhbGciOiJIUzI1NiJ9
```

Claim Set : 内容

```Claim
{"iss":"joe",
 "exp":1300819380,
 "http://example.com/is_root":true}

エンコード後
eyJpc3MiOiJqb2UiLA0KICJleHAiOjEzMDA4MTkzODAsDQogImh0dHA6Ly9leGFtcGxlLmNvbS9pc19yb290Ijp0cnVlfQ
```

Signature : 上記のHeaderとClaimを繋げてRSA等で署名したもの

```Signature
dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
```

JWTは上記のHeader、Claim Set、Signatureをドット(.)で繋げると出来上がる

```JWT
eyJ0eXAiOiJKV1QiLA0KICJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJqb2UiLA0KICJleHAiOjEzMDA4MTkzODAsDQogImh0dHA6Ly9leGFtcGxlLmNvbS9pc19yb290Ijp0cnVlfQ.dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
```


## 使用するGem
- gem 'jwt' を使用
- ドキュメントが分かりやすくシンプルであるため

## Usage
- gem 'jwt'の使い方概要
- RSAの場合

```
require 'jwt'

# sample data
payload = {
  id: 1,
  name: 'tanaka',
  password: 'jau0328ura0jrdsf3'
}

# 秘密鍵生成
rsa_private = OpenSSL::PKey::RSA.generate 2048

# 公開鍵生成
rsa_public = rsa_private.public_key

# APIに送信するJWTのトークン
token = JWT.encode payload, rsa_private, 'RS256'

# API側でのデコード
decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }
data = decoded_token.first
```


## 参考URL

- JWT解説 : http://oauth.jp/blog/2012/10/26/json-web-token-jwt/
- JWT仕様日本語版 : http://openid-foundation-japan.github.io/draft-ietf-oauth-json-web-token-11.ja.html
