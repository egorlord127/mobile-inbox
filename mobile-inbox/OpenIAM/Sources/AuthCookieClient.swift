//
//  AuthCookieClient.swift
//  mobile-inbox
//
//  Created by Egor Lord on 7/22/17.
//  Copyright © 2017 Egor Lord. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthCookieClient: RestHelper, RestProtocol {
    // MARK: - Members
    let server: String!
    var loginPath: String = "/idp/login.html"
    var refreshPath: String = "/selfservice/myInfo.html"
    
    
    // MARK: - Initialization
    init(_ server: String!, _ loginPath: String? = nil, _ refreshPath: String? = nil) {
        self.server = server
        if loginPath != nil {
            self.loginPath = loginPath!
        }
        
        if refreshPath != nil {
            self.refreshPath = refreshPath!
        }
    }
    
    func login(username: String, password: String, completionHandler: @escaping (RestResponse) -> Void) {
        let parameters: Parameters? = ["login": username,
                                       "password": password]
        
        RestHelper.restCall(server + loginPath, method: .post, parameters: parameters) {
            response in
            if(response.error == nil) {
                print("Successfully logged in")
            }
            completionHandler(response)
        }
    }
    
}
