//
//  UserReducer.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import ReSwift

struct UserState {
    var currentUser: User?
}

func userReducer(action: Action, state: UserState?) -> UserState {
    var newState = state ?? UserState()
    
    switch action {
    case let action as SetUserAction:
        newState.currentUser = action.user
    default:
        break
    }
    
    return newState
}
