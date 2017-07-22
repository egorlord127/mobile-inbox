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
    init(server: String!, loginPath: String? = nil, refreshPath: String? = nil) {
        self.server = server
        if loginPath != nil {
            self.loginPath = loginPath!
        }
        
        if refreshPath != nil {
            self.refreshPath = refreshPath!
        }
    }
//    RestResponse(error: nil, json: Optional({
//    "passwordExpired" : false,
//    "successToken" : null,
//    "unlockURL" : null,
//    "userId" : null,
//    "error" : true,
//    "status" : 500,
//    "contextValues" : null,
//    "tokenInfo" : null,
//    "errorList" : [
//    {
//    "validationError" : null,
//    "message" : "Invalid Login and\/or Password",
//    "params" : null,
//    "i18nError" : null,
//    "error" : "INVALID_LOGIN"
//    }
//    ],
//    "objectId" : null,
//    "possibleErrors" : null,
//    "successMessage" : null,
//    "redirectURL" : null
//    }))
    
//    RestResponse(error: nil, json: Optional({
//    "passwordExpired" : false,
//    "successToken" : null,
//    "unlockURL" : null,
//    "userId" : "3000",
//    "error" : false,
//    "status" : 200,
//    "contextValues" : null,
//    "tokenInfo" : {
//    "timeToLiveSeconds" : -1,
//    "authToken" : "NvgaL0WrsM3jDtW\/dRovyYBK3cBR0JU7R1Oo7h9AHwPEUxU+Klv6ve0oc8o6jN3x7oXuyhcELmGnQKYrc3EpXoAnrmOn1S3aONzphjy5iXM6EArF+0PdEUarTHuofXQS+9iQDg372J1yvdSKv+hlRA=="
//    },
//    "errorList" : null,
//    "objectId" : null,
//    "possibleErrors" : null,
//    "successMessage" : null,
//    "redirectURL" : "\/selfservice"
//    }))
    
    
    func login(username: String, password: String, completionHandler: @escaping (RestResponse) -> Void) {
        let parameters: Parameters? = ["login": username,
                                       "password": password]
        
        RestHelper.restCall(server + loginPath, method: .post, parameters: parameters) {
            response in
            print(response)
            if(response.error != nil) {
                print("Log in Failed")
                completionHandler(response)
            }
            
            if response.json?["userId"] == nil {
                print("no such user")
                completionHandler(response)
            }
            
            if response.json?["error"] == true {
                print("error occured while logging in")
                completionHandler(response)
            }
            
            print("Successfully logged in OpenIAM")
            
        }
    }
    
}
