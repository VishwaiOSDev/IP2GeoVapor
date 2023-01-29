# 1
FROM swift:5.7
WORKDIR /app
COPY . .

# 3
RUN swift package clean
RUN swift build
RUN swift test

# 4
RUN mkdir /app/bin
RUN mv `swift build --show-bin-path` /app/bin

# 5
EXPOSE 3001
ENTRYPOINT ./bin/debug/Run serve --env local --hostname 0.0.0.0
