FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/jmcquown/CommitCount

ENV USER jackmcquown
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET QPJrR3qWtZjHrXQf

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://jackmcquown@localhost:5432/CommitCount?sslmode=disable

WORKDIR /go/src/github.com/jmcquown/CommitCount

RUN godep go build

EXPOSE 8888
CMD ./CommitCount