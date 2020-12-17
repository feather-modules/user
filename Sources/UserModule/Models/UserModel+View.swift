//
//  UserModel+View.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 06. 02..
//

import FeatherCore

extension UserModel: LeafDataRepresentable {

    var leafData: LeafData {
        .dictionary([
            "id": id,
            "email": email,
            "root": root,
            "roles": $roles.value != nil ? roles.map(\.leafData) : [],
        ])
    }
}

extension UserModel: FormFieldOptionRepresentable {

    var formFieldOption: FormFieldOption {
        .init(key: id!.uuidString, label: email)
    }
}
