# # # # # # # #
# Build Stage
#FROM golang:1.20 AS builder
FROM golang:1.20-alpine AS builder

ENV GO111MODULE=on
ARG SERVICE_NAME

WORKDIR $GOPATH/src/github.com/paricorpdev/ms-report-service

ADD . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-extldflags "-static"' -o apps ./cmd/main.go


# Final Stage
#FROM alpine:latest
FROM alpine:3.9

RUN apk add --no-cache ca-certificates
RUN apk add --no-cache tzdata
ENV TZ=Asia/Jakarta

WORKDIR /root/

COPY --from=builder /go/src/github.com/paricorpdev/ms-report-service/apps .
COPY --from=builder /go/src/github.com/paricorpdev/ms-report-service/configs/.env.example ./configs/.env

CMD ["./apps"]
EXPOSE 8080
