//
//  ViewController.swift
//  Autolayout_Donut_Chart
//
//  Created by jhlee on 10/28/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circleChartView = ChartWithTitleView()
        
        self.view.addSubview(circleChartView)
        circleChartView.translatesAutoresizingMaskIntoConstraints = false
        
        circleChartView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circleChartView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:  -150).isActive = true
        circleChartView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        circleChartView.heightAnchor.constraint(equalToConstant: 200).isActive = true
 
        circleChartView.segments = [
                (UIColor.systemRed, 50),
                (UIColor.systemBlue, 50),
                (UIColor.systemCyan, 180),
                (UIColor.systemMint, 120),
            ]
        
        let circleChartView2 = ChartWithTitleView()
        
        self.view.addSubview(circleChartView2)
        circleChartView2.translatesAutoresizingMaskIntoConstraints = false
        
        circleChartView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circleChartView2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:  150).isActive = true
        circleChartView2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        circleChartView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
 
        circleChartView2.segments = [
                (UIColor.systemRed, 50),
                (UIColor.systemBlue, 50),
                (UIColor.systemCyan, 180),
                (UIColor.systemMint, 120),
            ]

        circleChartView2.percent = 45.5
        
        circleChartView2.chartType = .pie
    }


}

