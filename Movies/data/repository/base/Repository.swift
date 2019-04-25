
import Foundation

protocol Repository {
    
    associatedtype Model
    associatedtype Identifier
    
    func get(identifier: Identifier, onDone: ((RepositoryResponse<Model>) -> ())?)
    func getAll(onDone: ((RepositoryResponse<[Model]>) -> ())?)
    func update(_: Model, onDone: ((RepositoryResponse<Model>) -> ())?)
}
