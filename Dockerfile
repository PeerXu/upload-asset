FROM debian:9-slim

RUN apt update && apt install jq curl file -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
