//
//  LocalSettings.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

enum LocalSettings {
    
    // MARK: - Keys
    
    static private let kAppWalkthroughStatusKey: String = "kAppWalkthroughStatusKey"
    
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
}
