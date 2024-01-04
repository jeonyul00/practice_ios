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
    }
    
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
