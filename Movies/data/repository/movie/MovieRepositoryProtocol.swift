import Foundation
import UIKit
protocol MovieRepositoryProtocol: Repository where Model == Movie, Identifier == String {
    func search(keyWord: String, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?)
}

