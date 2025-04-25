FROM alpine:3.21.3

RUN apk --no-cache add curl
RUN apk --no-cache add jq

WORKDIR /app
COPY . /app

CMD ["./check-hut.sh"]
