# m1rc34/docker-keeweb
Added ARM support on viossat/keeweb based on original keeweb/keeweb

Free cross-platform password manager compatible with KeePass.
https://keeweb.info/

- Alpine-based
- no TLS support, reverse proxy with TLS recommended

## Usage

```bash
docker run -d -p 80:80 m1rc34docker/keeweb
```
