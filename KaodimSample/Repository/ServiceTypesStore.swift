//
//  ServiceTypesStore.swift
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import Foundation

public class ServiceTypeListRepository: ServiceTypeRepository {
    
    public static let shared = ServiceTypeListRepository()
    private init() {}
    private let baseAPIURL = "https://5d1dae5d3374890014f005d1.mockapi.io/"
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func fetchServices(from endpoint: Endpoint, successHandler: @escaping (_ response: [ServiceTypeGroup]) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        guard let urlComponents = URLComponents(string: "\(baseAPIURL)\(endpoint.rawValue)") else {
            errorHandler(ApiError.invalidEndpoint)
            return
        }
        
        guard let url = urlComponents.url else {
            errorHandler(ApiError.invalidEndpoint)
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.handleError(errorHandler: errorHandler, error: ApiError.apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.handleError(errorHandler: errorHandler, error: ApiError.invalidResponse)
                return
            }
            
            guard let data = data else {
                self.handleError(errorHandler: errorHandler, error: ApiError.noData)
                return
            }
            
            do {
                let response = try self.jsonDecoder.decode([ServiceTypeGroup].self, from: data)
                DispatchQueue.main.async {
                    successHandler(response)
                }
            } catch {
                self.handleError(errorHandler: errorHandler, error: ApiError.serializationError)
            }
        }.resume()
        
    }
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
    
}
