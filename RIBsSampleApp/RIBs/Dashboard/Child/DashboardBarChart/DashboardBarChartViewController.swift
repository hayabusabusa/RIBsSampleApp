//
//  DashboardBarChartViewController.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Charts

protocol DashboardBarChartPresentableListener: class {
    
}

final class DashboardBarChartViewController: UIViewController, DashboardBarChartPresentable, DashboardBarChartViewControllable {

    weak var listener: DashboardBarChartPresentableListener?
    
    // MARK: Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCharts()
    }
}

// MARK: - Setup

extension DashboardBarChartViewController {
    
    private func setupViews() {
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCharts() {
        let dataEntry = [1, 2, 3, 4, 5].map { ChartDataEntry(x: Double($0), y: Double($0)) }
        let dataSet = BarChartDataSet(entries: dataEntry, label: "Label")
        let chartData = BarChartData(dataSet: dataSet)
        
        let chartView = HorizontalBarChartView(frame: .zero)
        chartView.data = chartData
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
