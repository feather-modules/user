//
//  UserRoleModel+Api.swift
//  UserModel
//
//  Created by Tibor Bodecs on 2020. 12. 21..
//

import FeatherCore
import UserModuleApi

extension UserRoleListObject: Content {}
extension UserRoleGetObject: Content {}
extension UserRoleCreateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("key", as: String.self, is: !.empty && .count(...250))
        validations.add("name", as: String.self, is: !.empty && .count(...250))
    }
}

extension UserRoleUpdateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("key", as: String.self, is: !.empty && .count(...250))
        validations.add("name", as: String.self, is: !.empty && .count(...250))
    }
}

extension UserRolePatchObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("key", as: String.self, is: !.empty && .count(...250), required: false)
        validations.add("name", as: String.self, is: !.empty && .count(...250), required: false)
    }
}

extension UserRoleModel: ApiContentRepresentable {

    var listContent: UserRoleListObject {
        .init(id: id!, name: name)
    }

    var getContent: UserRoleGetObject {
        .init(id: id!, key: key, name: name, notes: notes)
    }

    func create(_ input: UserRoleCreateObject) throws {
        key = input.key
        name = input.name
        notes = input.notes
    }

    func update(_ input: UserRoleUpdateObject) throws {
        key = input.key
        name = input.name
        notes = input.notes
    }

    func patch(_ input: UserRolePatchObject) throws {
        key = input.key ?? key
        name = input.name ?? name
        notes = input.notes ?? notes
    }
}
