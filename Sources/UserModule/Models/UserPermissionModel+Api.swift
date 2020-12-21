//
//  UserPermissionModel+Api.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 12. 21..
//

import FeatherCore
import UserModuleApi

extension UserPermissionListObject: Content {}
extension UserPermissionGetObject: Content {}
extension UserPermissionCreateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("module", as: String.self, is: !.empty && .count(...250))
        validations.add("context", as: String.self, is: !.empty && .count(...250))
        validations.add("action", as: String.self, is: !.empty && .count(...250))
        validations.add("name", as: String.self, is: !.empty && .count(...250))
    }
}

extension UserPermissionUpdateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("module", as: String.self, is: !.empty && .count(...250))
        validations.add("context", as: String.self, is: !.empty && .count(...250))
        validations.add("action", as: String.self, is: !.empty && .count(...250))
        validations.add("name", as: String.self, is: !.empty && .count(...250))
    }
}

extension UserPermissionPatchObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("module", as: String.self, is: !.empty && .count(...250), required: false)
        validations.add("context", as: String.self, is: !.empty && .count(...250), required: false)
        validations.add("action", as: String.self, is: !.empty && .count(...250), required: false)
        validations.add("name", as: String.self, is: !.empty && .count(...250), required: false)
    }
}

extension UserPermissionModel: ApiContentRepresentable {

    var listContent: UserPermissionListObject {
        .init(id: id!, name: name)
    }

    var getContent: UserPermissionGetObject {
        .init(id: id!, module: module, context: context, action: action, name: name, notes: notes)
    }

    func create(_ input: UserPermissionCreateObject) throws {
        module = input.module
        context = input.context
        action = input.action
        name = input.name
        notes = input.notes
    }

    func update(_ input: UserPermissionUpdateObject) throws {
        module = input.module
        context = input.context
        action = input.action
        name = input.name
        notes = input.notes
    }

    func patch(_ input: UserPermissionPatchObject) throws {
        module = input.module ?? module
        context = input.context ?? context
        action = input.action ?? action
        name = input.name ?? name
        notes = input.notes ?? notes
    }
}
