FROM arm32v7/golang:latest
WORKDIR /app
COPY ./app .
RUN cd /app
RUN go get github.com/BurntSushi/toml
RUN go get github.com/bradfitz/gomemcache/memcache
RUN go get github.com/hoisie/redis
RUN go get github.com/miekg/dns
RUN go build -o godns .
EXPOSE 53
CMD ["./godns", "-c", "./etc/godns.conf"]
