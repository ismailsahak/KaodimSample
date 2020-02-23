//
//  ServiceType.swift
//  Kaodim Test
//
//  Created by Ismail Sahak on 22/02/2020.
//

public struct ServiceTypeSuperGroup: Codable {
    public let serviceTypeGroups: [ServiceTypeGroup]
}

public struct ServiceTypeGroup: Codable {
    public let id: Int
    public let name: String
    public let serviceTypes: [ServiceType]
}

public struct ServiceType: Codable {
    public let id: Int
    public let name: String
    public let imageThumbUrl: ImageThumbUrl?
}

public struct ImageThumbUrl: Codable {
    public let lg: String?
}
