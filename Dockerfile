FROM golang:1.22

# Set working directory
WORKDIR /app

# Copy isi folder src ke dalam container
COPY ./src ./

# Download dependency
RUN go mod tidy

# Build binary
RUN go build -o server .

# Run binary
CMD ["./server"]
