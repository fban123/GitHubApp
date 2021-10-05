struct UserDetailsViewModel {

    let name: String
    let username: String
    let avatarUrl: String
    let location: String
    let email: String
    let bio: String
    let createdAt: String
    let updatedAt: String
    let userUrl: String
    let userRepositories: [UserRepositoryViewModel]

    init(from model: UserModel) {
        name = model.name
        username = model.username
        avatarUrl = model.avatarUrl
        location = model.location
        email = model.email
        bio = model.bio
        createdAt = model.createdAt
        updatedAt = model.updatedAt
        userUrl = model.userUrl
        userRepositories = model.userRepositories.map { UserRepositoryViewModel(from: $0) }
    }

}
