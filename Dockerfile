FROM debian:12-slim
WORKDIR /app
RUN apt-get -qq update && apt-get -qq install wget jq && mkdir /run/dbus /app/output
RUN wget -O /usr/share/keyrings/cloudflare-warp-archive-keyring.asc https://pkg.cloudflareclient.com/pubkey.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.asc] https://pkg.cloudflareclient.com/ bookworm main" | tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt-get -qq update && apt-get -qq install cloudflare-warp
COPY wgcf-connector.sh .
ENTRYPOINT [ "/app/wgcf-connector.sh" ]