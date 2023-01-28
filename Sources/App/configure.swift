import Vapor

/// Configures the passed in `Application` object.
/// - Parameters:
///     - app: The `Application` object to be configured.
/// - Throws: An error if there's an issue configuring the application.
public func configure(_ app: Application) throws {
    
    // Set the port number for the application's HTTP server
    app.http.server.configuration.port = 3001
    
    // Register the application's routes
    try routes(app)
}
