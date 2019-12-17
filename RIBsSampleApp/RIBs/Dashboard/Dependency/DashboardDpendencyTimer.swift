//
//  DashboardDpendencyTimer.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardDependencyTimer: Dependency {
    
}

extension DashboardComponent: TimerDependency {
    
}
