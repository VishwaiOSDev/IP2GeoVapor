import Vapor

/// This function is used to register the routes for the application.
/// - Parameters:
///     - app: An instance of the Application class, which represents your Vapor application.
/// - Throws:If an error is thrown while registering the routes, it is propagated to the caller.
func routes(_ app: Application) throws {
    try app.register(collection: IP2GeoController())
}
