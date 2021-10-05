struct UserRepositoryViewModel: Hashable {

    let name: String
    let repoUrl: String
    let numOfWatchers: Int
    let numOfForks: Int
    let numOfIssues: Int

    init(from model: RepositoryModel) {
        self.name = model.name
        self.repoUrl = model.repoUrl
        self.numOfWatchers = model.numOfWatchers
        self.numOfForks = model.numOfForks
        self.numOfIssues = model.numOfIssues
    }

}
