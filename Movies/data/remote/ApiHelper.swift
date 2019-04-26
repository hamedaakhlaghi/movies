

import Foundation
import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class ApiHelper {
    
    static let movieDataBaseUrl = "www.omdbapi.com"
    static let moviePosterBaseUrl = "www.img.omdbapi.com"
    var alamofire: SessionManager!
    
    fileprivate var requestInterceptor: RequestInterceptor = RequestInterceptor()
    
    static let instance: ApiHelper = {
        let instance = ApiHelper()
        return instance
    }()
    
    //TODO(Fateme): Remove this in release mode
    private static var Manager : Alamofire.SessionManager = {
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "www.omdbapi.com": .disableEvaluation
        ]
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let man = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return man
    }()
    
    private init() {
        alamofire = ApiHelper.Manager
        alamofire.adapter = RequestInterceptor()
    }
    
    public static func newUrlComponentsInstance(baseUrl: String) -> NSURLComponents {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = baseUrl
        urlComponents.path = "/"
        return urlComponents
    }
    
    func stopTheRequests() {
        if #available(iOS 9.0, *) {
            Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
                tasks.forEach { $0.cancel() }
            }
        } else {
            Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
                sessionDataTask.forEach { $0.cancel() }
                uploadData.forEach { $0.cancel() }
                downloadData.forEach { $0.cancel() }
            }
        }
    }
}
