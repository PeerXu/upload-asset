FROM debian:9-slim

RUN apt update && apt install jq curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
