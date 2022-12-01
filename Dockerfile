FROM pandoc/minimal:latest-ubuntu

WORKDIR /data

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/data/entrypoint.sh"]
