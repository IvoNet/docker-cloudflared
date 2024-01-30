# Cloudflared

Cloudflare cli for managing tunnels / vpn's and the like.

## Usage

```shell
# login to cloudflare (one time only)
docker run \
    -it \
    --rm \
    -v "$(pwd)/cloudflared:/etc/cloudflared" \
    -e TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem \
    ivonet/cloudflared:latest \
    tunnel login

# create a tunnel (one time only)
docker run \
    -it \
    --rm \
    -v "$(pwd)/cloudflared:/etc/cloudflared" \
    -e TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem \
    ivonet/cloudflared:latest \
    tunnel create TUNNEL_NAME_HERE
    
# Create a dns route for the tunnel (one time only)
docker run \
    -it \
    --rm \
    -v "$(pwd)/cloudflared:/etc/cloudflared" \
    -e TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem \
    ivonet/cloudflared:latest \
    tunnel route dns TUNNEL_NAME_HERE TARGET_INTERNAL_URL_HERE

# start the tunnel (every time)
docker run \
    -it \
    --rm \
    -v "$(pwd)/cloudflared:/etc/cloudflared" \
    -e TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem \
    ivonet/cloudflared:latest \
    tunnel run TUNNEL_NAME_HERE
    
```
