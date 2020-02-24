//
//  ApiService.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import Foundation

public enum Endpoint: String, CaseIterable {
    case home = "api/v1/home"
    case events = "api/v1/events"
}

public enum ApiError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
