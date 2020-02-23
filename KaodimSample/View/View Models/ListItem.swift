//
//  ListItem.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

class ListItem {
    var rowCount: Int {
        let items = list.serviceTypes.count

        if items > 3 {
            if showMore == true {
                return items
            }
            return 4
        }
        return items
    }

    var sectionTitle: String {
        return list.name
    }

    var list: ServiceTypeGroup!
    var showMore: Bool = false
    var reloadSection: ((_ section: Int) -> Void)?
    var selectServiceType: ((_ service: ServiceType) -> Void)?
    var isFake: Bool {
        return list.id == -1
    }
    init(_ serviceResult: ServiceTypeGroup) {
        self.list = serviceResult
    }
}

