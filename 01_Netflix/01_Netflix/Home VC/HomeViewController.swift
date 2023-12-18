//
//  ViewController.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/18.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let headerView = HomeTableHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600)
        tableView.tableHeaderView = headerView
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension HomeViewController:UIScrollViewDelegate {
    // 움직인 값
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let area:CGFloat = 100
        let alpha = min(1,scrollView.contentOffset.y / area)
        if let homeNavi = self.navigationController as? HomeNaviViewController {
            homeNavi.effectViewAlpha = alpha
        }
    }
}

