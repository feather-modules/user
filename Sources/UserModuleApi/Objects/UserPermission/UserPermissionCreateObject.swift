//
//  UserPermissionModule.swift
//  UserPermission
//
//  Created by Tibor Bödecs on 2020. 12. 21..
//

import Foundation

public struct UserPermissionCreateObject: Codable {

    public var module: String
    public var context: String
    public var action: String
    public var name: String
    public var notes: String?

    public init(module: String,
                context: String,
                action: String,
                name: String,
                notes: String? = nil) {
        self.module = module
        self.context = context
        self.action = action
        self.name = name
        self.notes = notes
    }

}
