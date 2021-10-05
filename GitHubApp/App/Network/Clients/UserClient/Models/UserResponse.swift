struct UserResponse: Decodable {

    let name: String?
    let username: String
    let avatarUrl: String
    let location: String?
    let email: String?
    let bio: String?
    let createdAt: String
    let updatedAt: String
    let userUrl: String
    let reposUrl: String

    enum CodingKeys: String, CodingKey {
        case name, location, email, bio
        case username = "login"
        case avatarUrl = "avatar_url"
        case userUrl = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case reposUrl = "repos_url"
    }

}
