import Foundation

class Environment {

    static var current: EnvironmentType {
        guard
            let environmet = Bundle.main.object(forInfoDictionaryKey: "Environment") as? String
        else {
            return .production
        }

        return EnvironmentType(rawValue: environmet) ?? .production
    }

}

enum EnvironmentType: String {

    case production = "Production"
    case staging = "Staging"
    case test = "Test"

}
