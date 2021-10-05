struct RepositoryResponse: Decodable {

    let name: String
    let fullName: String
    let description: String?
    let visibility: String
    let numOfWatchers: Int
    let numOfForks: Int
    let numOfIssues: Int
    let language: String?
    let createdAt: String
    let updatedAt: String
    let repoUrl: String
    let ownerName: String
    let ownerAvatarUrl: String
    let ownerUrl: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        fullName = try values.decode(String.self, forKey: .fullName)
        description = try? values.decode(String.self, forKey: .description)
        numOfWatchers = try values.decode(Int.self, forKey: .numOfWatchers)
        visibility = try values.decode(String.self, forKey: .visibility)
        numOfForks = try values.decode(Int.self, forKey: .numOfForks)
        numOfIssues = try values.decode(Int.self, forKey: .numOfIssues)
        language = try? values.decode(String.self, forKey: .language)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        updatedAt = try values.decode(String.self, forKey: .updatedAt)
        repoUrl = try values.decode(String.self, forKey: .repoUrl)
        let ownerValues = try values.nestedContainer(keyedBy: OwnerKeys.self, forKey: .owner)
        ownerName = try ownerValues.decode(String.self, forKey: .ownerName)
        ownerAvatarUrl = try ownerValues.decode(String.self, forKey: .ownerAvatarUrl)
        ownerUrl = try ownerValues.decode(String.self, forKey: .ownerUrl)
    }

    enum CodingKeys: String, CodingKey {
        case name, description, visibility, language, owner
        case fullName = "full_name"
        case numOfForks = "forks"
        case numOfIssues = "open_issues"
        case numOfWatchers = "watchers"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case repoUrl = "html_url"
    }

    enum OwnerKeys: String, CodingKey {
        case ownerName = "login"
        case ownerAvatarUrl = "avatar_url"
        case ownerUrl = "html_url"
    }

}
