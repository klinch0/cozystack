FROM golang:1.23-alpine as builder

WORKDIR /workspace

COPY go.mod go.sum ./
RUN go mod download

COPY api api/
COPY pkg pkg/
COPY cmd cmd/
COPY internal internal/

RUN CGO_ENABLED=0 go build -ldflags="-extldflags=-static" -o /cozystack-controller cmd/cozystack-controller/main.go

FROM scratch

COPY --from=builder /cozystack-controller /cozystack-controller
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/cozystack-controller"]
