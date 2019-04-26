
import Foundation

protocol Repository {
    
    associatedtype Model
    associatedtype Identifier
    
    func get(_: Model, onDone: ((RepositoryResponse<Model>) -> ())?)
    func getAll(onDone: ((RepositoryResponse<[Model]>) -> ())?)
    func update(_: Model, onDone: ((RepositoryResponse<Model>) -> ())?)
}
