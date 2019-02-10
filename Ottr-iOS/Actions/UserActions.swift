//
//  UserActions.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import ReSwift
import ReSwiftThunk

struct SetUserAction: Action {
    let user: User
}

let fetchUser = Thunk<AppState> { dispatch, getState in
    API.request(path: "/auth/current_user", dataType: User.self) { (user, error) in
        if let error = error {
            print(error)
        }
        
        if let user = user {
            DispatchQueue.main.async {
                dispatch(SetUserAction(user: user))
            }
        }
    }
}

//func fetchUser(state: AppState, store: Store<AppState>) -> SetUserAction? {
//    DispatchQueue.main.async {
//        store.dispatch(SetUserAction(user: user))
//    }
//
//    return nil
//}
