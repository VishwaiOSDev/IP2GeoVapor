import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    app.http.server.configuration.port = 3001
    
    // register routes
    try routes(app)
}
