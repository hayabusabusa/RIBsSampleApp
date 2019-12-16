//
//  AppComponent.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
