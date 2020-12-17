//
//  UserPermissionAdminController.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 03. 23..
//

import FeatherCore
import Fluent

struct UserPermissionAdminController: ViperAdminViewController {
    
    typealias Module = UserModule
    typealias Model = UserPermissionModel
    typealias CreateForm = UserPermissionEditForm
    typealias UpdateForm = UserPermissionEditForm

    var listAllowedOrders: [FieldKey] = [
        Model.FieldKeys.name,
    ]

    func listQuery(search: String, queryBuilder: QueryBuilder<UserPermissionModel>, req: Request) {
        queryBuilder.filter(\.$name ~~ search)
        queryBuilder.filter(\.$module ~~ search)
        queryBuilder.filter(\.$context ~~ search)
        queryBuilder.filter(\.$action ~~ search)
    }
}

