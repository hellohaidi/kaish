FROM alpine:edge

ARG AUUID="93f10ca1-1b0e-4b7e-bcb0-3de837ec9f71"
ARG CADDYIndexPage="https://github.com/tailwindtoolbox/Landing-Page/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
