# Use the official Golang Alpine image as a build stage
FROM golang:1.21.6-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the Go modules and install dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o gin-app

#commands to run the application
CMD [ "./gin-app" ]

#expose the port to the localhost
EXPOSE 8082