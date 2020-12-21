//
//  UserApiContentController.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 12. 21..
//

import FeatherCore
import UserModuleApi

struct UserApiContentController: ViperApiContentController {
    typealias Module = UserModule
    typealias Model = UserModel
    
    /// after a succesful user authentication this method returns a token for a given user
    func login(req: Request) throws -> EventLoopFuture<UserTokenObject> {
        guard let user = req.auth.get(UserModel.self) else {
            throw Abort(.unauthorized)
        }
        let tokenValue = [UInt8].random(count: 16).base64
        let token = UserTokenModel(value: tokenValue, userId: user.id!)
        return token.create(on: req.db).map { token.getContent }
    }
}
