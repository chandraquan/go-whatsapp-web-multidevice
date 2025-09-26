FROM golang:1.24

WORKDIR /app
COPY ./src ./

# deps & build
RUN go mod tidy
RUN go build -o server .

# folder default untuk sqlite (opsional tapi bagus)
RUN mkdir -p /app/storages

# Jalankan REST server.
# Catatan: array CMD tidak expand env var, jadi pakai sh -c agar ${PORT} bisa kebaca.
# Flag lain diambil dari ENV yang sudah kamu set di Koyeb: APP_BASIC_AUTH, APP_ACCOUNT_VALIDATION, WHATSAPP_* (lihat catatan di bawah).
CMD ["sh", "-c", "./server rest --port ${PORT:-3000}"]
