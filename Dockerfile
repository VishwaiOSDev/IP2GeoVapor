# Use the latest version of the official Swift Docker image
FROM swift:5.7

# Set the working directory in the container
WORKDIR /app

# Copy the contents of the local directory to the container
COPY . .

# Expose the default Vapor port
EXPOSE 3001

# Set the command to run when the container starts
CMD [".build/release/Run", "serve", "--env", "production"]
