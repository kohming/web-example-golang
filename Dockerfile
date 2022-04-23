FROM golang:1.17-alpine as dev

LABEL authors="pfebrian@gmail.com"

# Run the air command in the directory where our code will live
WORKDIR /opt/app/api

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /web-example-golang

EXPOSE 8080

CMD [ "/web-example-golang" ]