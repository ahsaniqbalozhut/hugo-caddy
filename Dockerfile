FROM klakegg/hugo:0.101.0-ext-ubuntu AS builder
COPY . /site
WORKDIR /site
RUN hugo

FROM caddy:2.7.6-alpine
COPY --from=builder /site/public /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile
