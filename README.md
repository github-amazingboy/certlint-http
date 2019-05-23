# certlint-http
this is a docker repo which the certificate cablint with HTTP. it build on awslabs/certlint
# install by dockerfile
``` shell
git clone https://github.com/github-amazingboy/certlint-http.git
cd certlint-http
docker build -t certlint-http .

#show images
docker images
#run container
docker run -itd -name certlint -p 8000:8000 certlint-http
```
# install by docker repo
``` shell
docker pull amazingboy/certlint-http
docker run -itd -name certlint -p 8000:8000 amazingboy/certlint-http
```

# usage
```rest
POST http://127.0.0.1:8000/cablint HTTP/1.1


-----BEGIN CERTIFICATE-----
MIIG5zCCBM+gAwIBAgITIAAGWjYq07YToddMngAAAAZaNjANBgkqhkiG9w0BAQsF
ADCBizELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
...
fmQOJtvuOVPynuosmArEPsSG3uVdCZKhAD8Ppdwyo7fIzxnVpO+uV04qfg==
-----END CERTIFICATE-----

-----response-----
I: Certificate Transparency Precertificate identified,W: Microsoft extension 1.3.6.1.4.1.311.21.10 treated as opaque extension,W: Microsoft extension 1.3.6.1.4.1.311.21.7 treated as opaque extension,W: Extension should be critical for KeyUsage,I: TLS Server certificate identified
```

# other
the repo data [gtld,public_suffix_list] maybe outdated, can send a get request for updating data.
http://127.0.0.1:8000/updatedata

