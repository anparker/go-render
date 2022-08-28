FROM golang:1.19-alpine as builder

WORKDIR /app
COPY . /app

RUN ls -l
RUN go build -ldflags  "-s -w -extldflags \"-static\"" -o /app/render ./cmd/render

FROM alpine:3
COPY --from=builder /app/render /render
ENTRYPOINT ["/render"]
