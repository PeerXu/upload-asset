FROM debian:9-slim

RUN apt update && apt install jq curl -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
