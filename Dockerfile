FROM caddy:builder AS builder
RUN xcaddy build --with github.com/jasonlovesdoggo/caddy-defender@main

FROM caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY ./Caddyfile /etc/caddy/
COPY ./crack.txt /
