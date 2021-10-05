enum HttpStatusCode: Int {

    case ok = 200
    case created = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case requestTimeout = 408
    case unsupportedMediaType = 415
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504

}
