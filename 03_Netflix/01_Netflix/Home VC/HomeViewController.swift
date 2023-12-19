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
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tableView.register(HomeTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "HomeTableViewHeaderView")
        tableView.backgroundColor = .black
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 헤더
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeaderView") as! HomeTableViewHeaderView
        headerView.title = MediaType(rawValue: section)?.title
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    // 행
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return MediaType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell",for: indexPath) as! HomeCell
        cell.requestMediaAPI(type: MediaType(rawValue: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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

