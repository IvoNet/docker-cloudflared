FROM ubuntu:22.04
# https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/#linux
RUN apt-get update \
 && apt-get install --no-install-recommends -y  \
    ca-certificates \
    curl \
 && apt-get clean  \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN case "$(uname -m)" in \
    'amd64'|'x86_64') \
        curl -L -o /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 ;; \
    'arm64'|'aarch64') \
        curl -L -o /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64;; \
    *) echo "Unsupported architecture"; exit 1 ;; \
    esac \
 && chmod +x /usr/local/bin/cloudflared \
 && ln -s /etc/cloudflared /root/.cloudflared \
 && cloudflared --version

ENV TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem

ENTRYPOINT ["/usr/local/bin/cloudflared", "--no-autoupdate", "-origincert", "/etc/cloudflared/cert.pem"]

VOLUME ["/etc/cloudflared"]

CMD ["--config", "/etc/cloudflared/config.yaml", "list"]
