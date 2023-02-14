# Use the latest version of the official Swift Docker image
FROM swift:5.7

# Set the working directory in the container
WORKDIR /app

# Copy the contents of the local directory to the container
COPY . .

# Build the Swift Vapor API
RUN swift build

# 4
RUN mkdir /app/bin
RUN mv `swift build --show-bin-path` /app/bin

# 5
EXPOSE 3001
ENTRYPOINT ./bin/debug/Run serve --env local --hostname 0.0.0.0
