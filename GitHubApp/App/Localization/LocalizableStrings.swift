import Foundation

enum LocalizableStrings: String, Localizable {
    
    case searchPlaceholder = "search.placeholder"
    case sortTitle = "sortContainer.title"
    case backgroundMessage = "collectionView.background.message"
    case issuesRepoFormat = "repositoryCell.issues"
    case authorTitle = "repositoryDetails.author.title"
    case createdFormat = "repositoryDetails.date.created"
    case updatedFormat = "repositoryDetails.date.updated"
    case userRepositoriesTitle = "userDetails.repositories.title"

    var bundle: Bundle {
        Bundle.main
    }

    var tableName: String {
        "Localizable"
    }

}

extension LocalizableStrings {

    func localizedWithArguments(_ arguments: [CVarArg]) -> String {
        String(format: localized, arguments: arguments)
    }

}

