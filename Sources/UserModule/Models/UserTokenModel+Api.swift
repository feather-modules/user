//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2020. 12. 21..
//

import FeatherCore
import UserModuleApi

extension UserTokenObject: Content {}

extension UserTokenModel: GetContentRepresentable {

    var getContent: UserTokenObject {
        .init(id: id!, value: value, userId: $user.id)
    }
}

