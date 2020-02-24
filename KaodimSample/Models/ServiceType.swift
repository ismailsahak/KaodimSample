//
//  ServiceType.swift
//  Kaodim Test
//
//  Created by Ismail Sahak on 22/02/2020.
//

public struct ServiceTypeSuperGroup: Codable {
    public let serviceTypeGroups: [ServiceTypeGroup]
}

public struct ServiceTypeGroup: Codable, Equatable {
    public static func == (lhs: ServiceTypeGroup, rhs: ServiceTypeGroup) -> Bool {
        return lhs.serviceTypes == rhs.serviceTypes
    }
    
    public let id: Int
    public let name: String
    public let serviceTypes: [ServiceType]
    
    init(id: Int, name: String, serviceTypes: [ServiceType]) {
        self.id = id
        self.name = name
        self.serviceTypes = serviceTypes
    }
}

public struct ServiceType: Codable, Equatable {
    public static func == (lhs: ServiceType, rhs: ServiceType) -> Bool {
        return lhs == rhs
    }
    
    public let id: Int
    public let name: String
    public let imageThumbUrl: ImageThumbUrl?
    
    init(id: Int, name: String, imageThumbUrl: ImageThumbUrl?) {
        self.id = id
        self.name = name
        self.imageThumbUrl = imageThumbUrl
    }
}

public struct ImageThumbUrl: Codable {
    public let lg: String?
}
