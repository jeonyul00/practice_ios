//
//  ViewController.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = HomeTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 650))
        tableView.tableHeaderView = headerView
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    // 로우
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return MediaType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.requestMediaAPI(type: MediaType(rawValue: indexPath.section))
        return cell
    }
    
    // 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
}

extension HomeViewController:UIScrollViewDelegate {
    // 움직인 스크롤 값을 알 수 있다.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let area:CGFloat = 100
        let alpha = min(1, scrollView.contentOffset.y / area)
        if let homeNavi = self.navigationController as? HomeNaviViewController {
            homeNavi.effectViewAlpha = alpha
        }
        
    }
}
