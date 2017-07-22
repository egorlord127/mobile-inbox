//
//  ViewController.swift
//  mobile-inbox
//
//  Created by Egor Lord on 7/21/17.
//  Copyright © 2017 Egor Lord. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let model = AuthCookieClient(server: "http://lnx1.openiamdemo.com")
        model.login(username: "Administrator11", password: "passwd$11") {_ in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

