//
//  UserFrontendController.swift
//  UserModule
//
//  Created by Tibor Bodecs on 2020. 03. 27..
//

import FeatherCore

struct UserFrontendController {

    // MARK: - private
    
    private func render(req: Request, model: UserModel? = nil, form: UserLoginForm = .init()) -> EventLoopFuture<Response> {
        if let model = model {
            form.email.value = model.email
        }

        return req.tau.render(template: "User/Frontend/Login", context: .init(form.templateData.dictionary!))
            .encodeResponse(for: req)
    }

    private func getCustomRedirect(req: Request) -> String {
        if let customRedirect: String = req.query["redirect"], !customRedirect.isEmpty {
            return customRedirect.safePath()
        }
        return "/"
    }
    
    // MARK: - api
    
    func loginView(req: Request) throws -> EventLoopFuture<Response> {
        guard req.auth.has(UserModel.self) else {
            return render(req: req)
        }
        let response = req.redirect(to: getCustomRedirect(req: req), type: .normal)
        return req.eventLoop.future(response)
    }

    func login(req: Request) throws -> EventLoopFuture<Response> {
        if let user = req.auth.get(UserModel.self) {
            req.session.authenticate(user)
            return req.eventLoop.future(req.redirect(to: getCustomRedirect(req: req)))
        }
        let form = UserLoginForm()
        return form.initialize(req: req)
            .flatMap {
                form.validate(req: req)
            }
            .flatMap { _ in
                form.notification = "Invalid username or password"
                return render(req: req, form: form)
            }
    }

    func logout(req: Request) throws -> Response {
        req.auth.logout(UserModel.self)
        req.session.unauthenticate(UserModel.self)
        return req.redirect(to: getCustomRedirect(req: req))
    }
}
