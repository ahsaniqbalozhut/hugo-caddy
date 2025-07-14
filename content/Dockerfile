# Dockerfile
FROM klakegg/hugo:0.121.2-ext-alpine AS builder
COPY . /site
WORKDIR /site
RUN hugo

FROM caddy:2.7.6-alpine
COPY --from=builder /site/public /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile
