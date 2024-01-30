# Cloudflared

Cloudflare cli for managing tunnels / vpn's and the like.

## Usage

```shell
docker run -v $(pwd)/volumes/cloudflared:/etc/cloudflared -e TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem cloudflare/cloudflared -origincert=/etc/cloudflared/cert.pem tunnel login
```
