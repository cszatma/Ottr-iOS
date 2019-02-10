//
//  ViewController.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import UIKit
import Alamofire
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
    func newState(state: AppState) {
        print(state.userState.currentUser)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.dispatch(fetchUser)
        // Do any additional setup after loading the view, typically from a nib.
        let url = "http://localhost:8000"
        // Do any additional setup after loading the view, typically from a nib.
//            let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as! [String : String], for: (response.response?.url)!)
//
//            if let cookie = cookies.first {
//                Cookie.set(cookie: cookie, forKey: Cookie.userSession)
//            } else if let cookies = HTTPCookieStorage.shared.cookies {
//                Cookie.set(cookie: cookies[0], forKey: Cookie.userSession)
//            }
//
//            Alamofire.request("\(url)/api/auth/current_user").responseJSON { response in
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
//                print(json)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

