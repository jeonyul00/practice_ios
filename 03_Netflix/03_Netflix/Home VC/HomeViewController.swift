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
        tableView.register(HomeTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "HomeTableViewHeaderView")
        tableView.backgroundColor = .black
        registObserver()
    }
    
    
    // notification 옵저버 등록 -> 어딘가에서 신호를 주면 그 신호를 받을 수 있도록 관찰하고 있어야함
    // 수신 준비: presentDetailVC라는 이름으로 포스팅이 발생되면 presentDetailVC를 호출
    func registObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(presentDetailVC), name: NSNotification.Name("presentDetailVC"), object: nil)
    }
            
    @objc func presentDetailVC(notification:Notification){
        // notification: 포스트 할 때 전달됨
        if let hasResult = notification.object as? MovieResult {
            let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailVC.movieResult = hasResult
            present(detailVC, animated: true)
        }
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    // section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeaderView") as! HomeTableViewHeaderView
        headerView.title = MediaType(rawValue: section)?.title
        return headerView
    }
    
    // 헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
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
