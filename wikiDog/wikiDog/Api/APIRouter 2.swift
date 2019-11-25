//
//  APIRouter.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible
{
  
    //Initial user
    case getDogs
    case getImages(name:String)
  
  
    // MARK: - HTTPMethod
    private var method: HTTPMethod
    {
        switch self
        {
        case .getDogs:
          return .get
        case .getImages:
          return .get
      }
    }
    
    // MARK: - Path
    private var path: String
    {
        switch self
        {
        case .getDogs:
            return "/breeds/list/all"
        case .getImages(let name):
            return "/breed/\(name)/images"
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters?
    {
        switch self
        {
        case .getDogs:
          return nil
        case .getImages:
          return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest
    {
      
        let urlString = Api.Server.debugURL ? Api.Server.testUrl : Api.Server.baseURL
        let url = URL(string: urlString + Api.Server.version)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
     
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
      
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
      
        // Parameters
        if let parameters = parameters
        {
            do
            {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch
            {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
  
}

