//
//  User.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import CoreLocation

struct User: Codable {
    var id: String
    var name: String
    var email: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var points: Int
}
