//
//  File.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 08. 23..
//

import FeatherCore

@_cdecl("createUserModule")
public func createUserModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(UserBuilder()).toOpaque()
}

public final class UserBuilder: ViperBuilder {

    public override func build() -> ViperModule {
        return UserModule()
    }
}
