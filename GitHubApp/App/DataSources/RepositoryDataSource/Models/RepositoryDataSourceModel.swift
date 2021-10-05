struct RepositoryDataSourceModel {

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

    init(from model: RepositoryResponse) {
        name = model.name
        fullName = model.fullName
        description = model.description
        visibility = model.visibility
        numOfWatchers = model.numOfWatchers
        numOfForks = model.numOfForks
        numOfIssues = model.numOfIssues
        language = model.language
        createdAt = model.createdAt
        updatedAt = model.updatedAt
        repoUrl = model.repoUrl
        ownerName = model.ownerName
        ownerAvatarUrl = model.ownerAvatarUrl
        ownerUrl = model.ownerUrl
    }

}
