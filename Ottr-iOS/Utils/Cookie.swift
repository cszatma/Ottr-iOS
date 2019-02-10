//
//  Cookie.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import Foundation

struct Cookie {
    static let userSession = "user_session_cookie"
    
    static func get(forKey key: String) -> HTTPCookie? {
        if let properties = UserDefaults.standard.object(forKey: key) as? [HTTPCookiePropertyKey : Any] {
            return HTTPCookie(properties: properties)
        }
        
        return nil
    }
    
    static func set(cookie: HTTPCookie, forKey key: String) {
        UserDefaults.standard.set(cookie.properties, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
