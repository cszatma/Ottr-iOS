//
//  AppReducer.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var userState: UserState
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        userState: userReducer(action: action, state: state?.userState)
    )
}
