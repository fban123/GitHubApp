struct RepositoryViewModel: Hashable {

    let name: String
    let fullName: String
    let ownerName: String
    let ownerAvatarUrl: String
    let numOfWatchers: Int
    let numOfForks: Int
    let numOfIssues: Int

    init(from model: RepositoryModel) {
        name = model.name
        fullName = model.fullName
        ownerName = model.ownerName
        ownerAvatarUrl = model.ownerAvatarUrl
        numOfWatchers = model.numOfWatchers
        numOfForks = model.numOfForks
        numOfIssues = model.numOfIssues
    }

}
