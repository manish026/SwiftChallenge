//
//  Webservice.swift
//  LalamoveSwift
//
//  Created by Manish on 14/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation
import Alamofire

struct Webservice {
    
    /// init is private so that Webservice cannot be initialized
    private init() { }
    
    private enum API: URLRequestConvertible {

        static let baseURLString = "http://127.0.0.1:8000/"
        /// API types
        case deliveries(offsetBy:Int)
        /// Returns API methods
        var method: HTTPMethod {
            
            switch self {
                
            case .deliveries: return .get
                
            }
            
        }
        /// Returns API methods
        var path: String {
            
            switch self {
                
            case .deliveries(_): return "deliveries"
                
                
            }
        }
        /// Returns url request
        func asURLRequest() throws -> URLRequest {
            
            let url = try API.baseURLString.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            switch self {
            case .deliveries(let offset):
                
                var parameters:[String: Any] = [:]
                parameters["limit"] = Constants.fetchLimit
                parameters["offset"] = offset
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)

            }
            
            return urlRequest
            
        }
    }
    
    
}

extension Webservice {
    
    static func getDeliveries(offsetBy offset:Int, onSuccess success:@escaping ([Deliveries])->Void, onFailure failure: @escaping (String)->Void) {
        
        Alamofire.request(API.deliveries(offsetBy: offset)).responseDecodable { (response:DataResponse<[Deliveries]>) in
            
            switch response.result {
            case .success(let result):
                success(result)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
            
        }
        
    }
    
}
