FROM golang:1.18 AS builder

WORKDIR /app

RUN rm -rf /app

COPY *.go ./

RUN go build -o /app/desafio-compilado main.go

CMD [ "./desafio-compilado" ]


FROM scratch
WORKDIR /app
COPY --from=builder /app/desafio-compilado /app/desafio-compilado
CMD [ "./desafio-compilado" ]