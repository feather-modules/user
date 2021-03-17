//
//  main.swift
//  Feather
//
//  Created by Tibor Bodecs on 2019. 12. 17..
//

import FeatherCore

import CommonModule
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

try feather.configure([
    CommonBuilder(),
    SystemBuilder(),
    ApiBuilder(),
    AdminBuilder(),
    FrontendBuilder(),

    UserBuilder(),
])

if feather.app.isDebug {
    try feather.resetPublicFiles()
//    try feather.copyTemplatesIfNeeded()
}

try feather.start()
