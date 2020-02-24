//
//  ServiceTypeRepository.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 24/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import Foundation

protocol ServiceTypeRepository {
    func fetchServices(from endpoint: Endpoint, successHandler: @escaping (_ response: [ServiceTypeGroup]) -> Void, errorHandler: @escaping(_ error: Error) -> Void)
}
