//
//  UserDefaultsRepository.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

// MARK: - Interface

protocol UserDefaultsRepository {
    
}

// MARK: - Implementation

struct UserDefaultsRepositoryImpl: UserDefaultsRepository {
    
    // MARK: Keys
    
    private let kUserDefaultsStudyKey: String = "kUserDefaultsStudyKey"
    
    // MARK: Initializer
    
    init() {}
    
    // MARK: UserDefaults
    
    func saveStudy(_ study: Study) {
        var newArray: [Study] = [Study]()
        
        if let data = UserDefaults.standard.data(forKey: kUserDefaultsStudyKey),
            let stored = try? JSONDecoder().decode([Study].self, from: data) {
            newArray = stored
            newArray.append(study)
        } else {
            newArray.append(study)
        }
        
        if let encoded = try? JSONEncoder().encode(newArray) {
            UserDefaults.standard.set(encoded, forKey: kUserDefaultsStudyKey)
        }
    }
    
    func getStudies() -> [Study]? {
        guard let data = UserDefaults.standard.data(forKey: kUserDefaultsStudyKey),
            let stored = try? JSONDecoder().decode([Study].self, from: data) else { return nil }
        return stored
    }
    
    func deleteStudy(_ id: String) {
        guard let data = UserDefaults.standard.data(forKey: kUserDefaultsStudyKey),
            let stored = try? JSONDecoder().decode([Study].self, from: data),
            let targetIndex = stored.firstIndex(where: { $0.id == id }) else { return }
        
        var newArray = stored
        newArray.remove(at: targetIndex)
        
        if let encoded = try? JSONEncoder().encode(newArray) {
            UserDefaults.standard.set(encoded, forKey: kUserDefaultsStudyKey)
        }
    }
}
