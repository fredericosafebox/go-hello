FROM golang:1.21.4-alpine as builder

WORKDIR /usr/local/app

COPY . .

RUN go build -o /bin/hello ./hello.go


FROM scratch

COPY --from=builder /bin/hello /bin/hello

CMD ["/bin/hello"]
