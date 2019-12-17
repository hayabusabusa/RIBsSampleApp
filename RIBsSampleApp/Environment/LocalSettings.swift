//
//  LocalSettings.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

enum LocalSettings {
    
    enum LoginStatus: Int {
        case loggedOut
        case loggedIn
    }
    
    // MARK: - Keys
    
    static private let kAppWalkthroughStatusKey: String = "kAppWalkthroughStatusKey"
    static private let kAppLoginStatusKey: String = "kAppLoginStatusKey"
    
    // MARK: - Walkthrough
    
    static func saveWalkThroughStatus(_ isShown: Bool) {
        UserDefaults.standard.set(isShown, forKey: kAppWalkthroughStatusKey)
    }
    
    static func getWalkThroughStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: kAppWalkthroughStatusKey)
    }
    
    static func removeWalkthroughStatus() {
        UserDefaults.standard.removeObject(forKey: kAppWalkthroughStatusKey)
    }
    
    // MARK: - Login status
    
    static func saveLoginStatus(_ status: LoginStatus) {
        UserDefaults.standard.set(status.rawValue, forKey: kAppLoginStatusKey)
    }
    
    static func getLoginStatus() -> LoginStatus {
        guard let status = LoginStatus(rawValue: UserDefaults.standard.integer(forKey: kAppLoginStatusKey)) else {
            return .loggedOut
        }
        return status
    }
    
    static func removeLoginStatus() {
        UserDefaults.standard.removeObject(forKey: kAppLoginStatusKey)
    }
}
