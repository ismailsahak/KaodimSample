//
//  ServiceListViewModel.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ServiceListViewModel {
    
    private let apiService: ApiService
    private let disposeBag = DisposeBag()
    
    init(endpoint: Endpoint, apiService: ApiService) {
        self.apiService = apiService
        fetchServices(endpoint: endpoint)
    }
    
    private let _serviceTypeGroupList = BehaviorRelay<[ServiceTypeGroup]>(value: [])
    private let _isFetching = BehaviorRelay<Bool>(value: false)
    private let _error = BehaviorRelay<String?>(value: nil)
    
    var isFetching: Driver<Bool> {
        return _isFetching.asDriver()
    }
    
    var list: Driver<[ServiceTypeGroup]> {
        return _serviceTypeGroupList.asDriver()
    }
    
    var servicesGroupList: [ServiceTypeGroup] {
        return _serviceTypeGroupList.value
    }
    
    var error: Driver<String?> {
        return _error.asDriver()
    }
    
    var hasError: Bool {
        return _error.value != nil
    }
    
    var numberOfServiceGroups: Int {
        return _serviceTypeGroupList.value.count
    }
    
    func numberOfServiceTypes(index: Int) -> Int {
        return getItemList(index: index).rowCount
    }
    
    func getItemList(index: Int) -> ListItem {
        return ListItem(_serviceTypeGroupList.value[index])
    }
    
    private func fetchServices(endpoint: Endpoint) {
        self._serviceTypeGroupList.accept([])
        self._isFetching.accept(true)
        self._error.accept(nil)
        
        apiService.fetchServices(from: endpoint, successHandler: {[weak self] (response) in
            self?._isFetching.accept(false)
            self?._serviceTypeGroupList.accept(response)
            
        }) { [weak self] (error) in
            self?._isFetching.accept(false)
            self?._error.accept(error.localizedDescription)
        }
    }
    
}
