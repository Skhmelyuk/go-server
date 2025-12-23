FROM golang:alpine AS build
WORKDIR /go/bin
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-server .

FROM scratch
COPY --from=build /go/bin/go-server /go/bin/go-server
ENTRYPOINT [ "/go/bin/go-server" ]
EXPOSE 9000


