

import Foundation
import Alamofire
import AlamofireObjectMapper

class RequestInterceptor: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
        return urlRequest
    }
}

extension DataRequest {
    func intercept() -> Self {
        let serializedResponse = DataResponseSerializer<Any?> { request, response, data, error in

            return .success(data)
        }
        return response(responseSerializer: serializedResponse) { _ in }
    }
}
