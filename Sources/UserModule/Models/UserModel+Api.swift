//
//  UserModel+Api.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 12. 21..
//

import FeatherCore
import UserModuleApi

extension UserListObject: Content {}
extension UserGetObject: Content {}
extension UserCreateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: !.empty && .count(8...250))
    }
}

extension UserUpdateObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: !.empty && .count(8...250))
    }
}

extension UserPatchObject: ValidatableContent {

    public static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email, required: false)
        validations.add("password", as: String.self, is: !.empty && .count(8...250), required: false)
    }
}

extension UserModel: ApiContentRepresentable {

    var listContent: UserListObject {
        .init(id: id!, email: email, root: root)
    }

    var getContent: UserGetObject {
        .init(id: id!, email: email, root: root)
    }

    func create(_ input: UserCreateObject) throws {
        email = input.email
        password = input.password
        root = input.root ?? false
    }

    func update(_ input: UserUpdateObject) throws {
        email = input.email
        password = input.password
        root = input.root ?? false
    }

    func patch(_ input: UserPatchObject) throws {
        email = input.email ?? email
        password = input.password ?? password
        root = input.root ?? root
    }
}
