import Foundation
import Alamofire

struct RepositoryResponse<Model> {
    
    var value: Model?
    var restDataResponse: DataResponse<Model>?
    var error: Error?
    
    init(value: Model? = nil, restDataResponse: DataResponse<Model>? = nil, error: Error? = nil) {
        self.value = value
        self.restDataResponse = restDataResponse
        self.error = error
    }
    
    func getStatus() -> Status{
        if(error == nil){
            return Status.Success
        }
        return Status.Failure
    }
    
    enum Status{
        case Success
        case Failure
    }
}
