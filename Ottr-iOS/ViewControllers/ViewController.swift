//
//  ViewController.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "http://localhost:8000"
        // Do any additional setup after loading the view, typically from a nib.
        //        Alamofire.request("http://localhost:8000/test").responseJSON { response in
        //                guard response.result.error == nil else {
        //                    print(response.result.error!)
        //                    return
        //                }
        //
        //                guard let json = response.result.value as? [String: Any] else {
        //                    print("didn't get todo object as JSON from API")
        //                    if let error = response.result.error {
        //                        print("Error: \(error)")
        //                    }
        //                    return
        //                }
        //
        //                guard let name = json["name"] as? String else {
        //                    print("Could not get name from JSON")
        //                    return
        //                }
        //                print(name)
        //                print(json)
        //        }
        
        let parameters: Parameters = [
            "email": "chris@email.com",
            "password": "ottr"
        ]
        Alamofire.request("\(url)/api/auth/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard response.result.error == nil else {
                print(response.result.error!)
                return
            }
            
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                if let error = response.result.error {
                    print("Error: \(error)")
                }
                return
            }
            
            print(json)
            
            let cookies = NSHTTPCookie.cookiesWithResponseHeaderFields(response.response?.allHeaderFields as! [String: String], forURL: (response.response?.URL!)!)
            
            //Save method
            setCookie(cookies.first!)
            
            Alamofire.request("\(url)/api/auth/current_user").responseJSON { response in
                guard response.result.error == nil else {
                    print(response.result.error!)
                    return
                }
                
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                print(json)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

