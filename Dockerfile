FROM alpine:3.20

RUN apk add --no-cache bash

WORKDIR /app

COPY clear_cache.sh .

RUN chmod +x clear_cache.sh

CMD ["./clear_cache.sh"]
