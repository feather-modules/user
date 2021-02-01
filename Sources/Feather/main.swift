//
//  main.swift
//  Feather
//
//  Created by Tibor Bodecs on 2019. 12. 17..
//

import FeatherCore
import FluentSQLiteDriver
import LiquidLocalDriver

import SystemModule
import ApiModule
import AdminModule
import FrontendModule

import UserModule

/// setup metadata delegate object
Feather.metadataDelegate = FrontendMetadataDelegate()

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let feather = try Feather(env: env)
defer { feather.stop() }

feather.useSQLiteDatabase()
feather.useLocalFileStorage()
feather.usePublicFileMiddleware()
feather.setMaxUploadSize("10mb")

try feather.configure([
    /// core
    SystemBuilder(),
    ApiBuilder(),
    AdminBuilder(),
    FrontendBuilder(),
    UserBuilder(),
])


/// reset resources folder if we're in debug mode
if feather.app.isDebug {
    try feather.reset(resourcesOnly: false)
}

try feather.start()
