struct SearchResponse: Decodable {

    let repositories: [RepositoryResponse]

    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        repositories = try response.decode([RepositoryResponse].self, forKey: .repositories)
    }

    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }

}
