# nginx-ingress-proxy-cache
Simple way to cache external API in a cloud native way using Nginx Ingress and ExternalName Service

Above setup was created for caching responses from https://www.googleapis.com/

## Example usage:
`"https://www.googleapis.com/youtube/v3/videos?id=mX48y24t9iU&key=XYZ&part=snippet&fields=items/snippet/thumbnails"`

Cached data can be access from within the cluster by:

`curl "http://nginx-ingress-caching-controller.nginx-ingress-caching.svc.cluster.local/youtube/v3/videos?id=mX48y24t9iU&key=XYZ&part=snippet&fields=items/snippet/thumbnails" -H "Host: www.googleapis.com"`

## Notes:
- More APIs to be cached can be easily added via additional Ingress & Service (ExternalName) objects.
