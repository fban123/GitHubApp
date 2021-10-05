struct RepositoryDetailsViewModel {

    let name: String
    let description: String
    let numOfWatchers: Int
    let numOfForks: Int
    let numOfIssues: Int
    let language: String
    let createdAt: String
    let updatedAt: String
    let visibility: String
    let repoUrl: String
    let ownerName: String
    let ownerAvatarUrl: String
    let ownerUrl: String

    init(from model: RepositoryModel) {
        name = model.name
        description = model.description
        numOfWatchers = model.numOfWatchers
        numOfForks = model.numOfForks
        numOfIssues = model.numOfIssues
        language = model.language
        createdAt = model.createdAt
        updatedAt = model.updatedAt
        visibility = model.visibility
        repoUrl = model.repoUrl
        ownerName = model.ownerName
        ownerAvatarUrl = model.ownerAvatarUrl
        ownerUrl = model.ownerUrl
    }

}
