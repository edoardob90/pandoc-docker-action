FROM pandoc/minimal:latest

COPY . .

ENTRYPOINT ["entrypoint.sh"]
