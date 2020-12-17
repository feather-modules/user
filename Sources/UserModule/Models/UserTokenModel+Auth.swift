//
//  UserTokenModel+Auth.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 06. 02..
//

import FeatherCore

/// users can be authenticated using a Bearer token
extension UserTokenModel: ModelTokenAuthenticatable {
    static let valueKey = \UserTokenModel.$value
    static let userKey = \UserTokenModel.$user
    
    var isValid: Bool {
        true
    }
}

