//
//  ViewModelTests.swift
//  ViewModelTests
//
//  Created by Ismail Sahak on 24/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import XCTest
import RxCocoa
import Kaodim_Test

class ViewModelTests: XCTestCase {
    
    static let response: [ServiceTypeGroup] = {
        let page1 = ServiceTypeGroup(id: 1, name: "Cleaning", serviceTypes: [
            ServiceType(id: 1, name: "House Cleaning", imageThumbUrl: nil),
            ServiceType(id: 2, name: "Office Cleaning", imageThumbUrl: nil)])
        let page2 = ServiceTypeGroup(id: 2, name: "Plumbing", serviceTypes: [
            ServiceType(id: 3, name: "Plumbing Repair", imageThumbUrl: nil)])
        return [page1, page2]
    }()
    
    class ServiceTypeListRepositoryMock: ServiceTypeRepository {
        lazy var serviceTypeGroupList: [ServiceTypeGroup] = []
        var repo = ServiceTypeRepository.Protocol.self
        var expectation: XCTestExpectation?
        
        func fetchServices(from endpoint: Endpoint, successHandler: @escaping ([ServiceTypeGroup]) -> Void, errorHandler: @escaping (Error) -> Void) {
            successHandler(ViewModelTests.response)
        }
    }
    
    private enum ApiError: Error {
        case someError
    }
    
    func test_GetServiceTypeGroups() {
        // given
        let repository = ServiceTypeListRepositoryMock()
        
        repository.expectation = self.expectation(description: "Get service type group list")

        repository.serviceTypeGroupList = ViewModelTests.response
        
//        when
        let viewModel = ServiceListViewModel(endpoint: Endpoint.home, repository: repository)
        waitForExpectations(timeout: 5, handler: nil)
        
//        assert
        XCTAssertEqual(ViewModelTests.response, viewModel.servicesGroupList)
        
    }

}
