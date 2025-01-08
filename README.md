# wgcf-connector
Extract Cloudflare [WARP Connector](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/private-net/warp-connector/) WireGuard configuration

```
docker build -t wgcf-connector .
docker run --rm -v $(pwd):/app/output wgcf-connector <token>
```