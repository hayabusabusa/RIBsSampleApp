//
//  RootDependencyLogin.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol RootDependencyLogin: Dependency {
    
}

extension RootComponent: LoginDependency {
    
}
