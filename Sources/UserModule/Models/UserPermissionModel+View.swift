//
//  UserPermissionModel+View.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 06. 02..
//

import FeatherCore

extension UserPermissionModel: TemplateDataRepresentable {

    var templateData: TemplateData {
        .dictionary([
            "id": id,
            "key": key,
            "module": module,
            "context": context,
            "action": action,
            "name": name,
            "notes": notes,
        ])
    }
}

extension UserPermissionModel: FormFieldOptionRepresentable {

    var formFieldOption: FormFieldOption {
        .init(key: id!.uuidString, label: name)
    }
}
