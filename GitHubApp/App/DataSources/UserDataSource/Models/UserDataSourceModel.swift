struct UserDataSourceModel {

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

    init(from model: UserResponse) {
        name = model.name
        username = model.username
        avatarUrl = model.avatarUrl
        location = model.location
        email = model.email
        bio = model.bio
        createdAt = model.createdAt
        updatedAt = model.updatedAt
        userUrl = model.userUrl
        reposUrl = model.reposUrl
    }

}
