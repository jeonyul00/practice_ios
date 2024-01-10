//
//  NewHotViewController.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class NewHotViewController: UIViewController {
    
    @IBOutlet weak var newHotTableView: UITableView!
    var movieModel: MovieModel? {
        didSet {
            DispatchQueue.main.async {
                self.newHotTableView.reloadData()
            }
        }
    }
    
    // 화면이 안나올 때
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let visibleCells = newHotTableView.visibleCells as? [NewHotCell] else { return }
        visibleCells.forEach { cell in
            cell.movieStop()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "new & hot"
        self.navigationItem.titleView = lbl
        
        self.view.backgroundColor = .black
        newHotTableView.backgroundColor = .black
        newHotTableView.register(NewHotCell.self, forCellReuseIdentifier: "NewHotCell")
        newHotTableView.delegate = self
        newHotTableView.dataSource = self
        // 동적 높이 조절
        newHotTableView.rowHeight = UITableView.automaticDimension
        
        newHotTableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
        
        NetworkLayer.request(type: .movie) { model in
            self.movieModel = model
        }
    }
    
}

extension NewHotViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newHotTableView.dequeueReusableCell(withIdentifier: "NewHotCell", for: indexPath) as! NewHotCell
        let responseMovieResult =  self.movieModel?.results[indexPath.section]
        cell.movieResult = responseMovieResult
        return cell
    }
    
    // 셀 높이 동적 조절
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // header 높이 조절
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001 // 헤더가 가지고 있는 컨텐츠가 보이기 위해서는 0이면 안됨
    }
    
    // header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
        headerView.backgroundColor = .black
        
        if let dateString = movieModel?.results[section].releaseDate {
            let convertedDateString = CommonUtil.iso8601(date: dateString, format: "M월\ndd")
            let attributedString = NSMutableAttributedString(string: convertedDateString)
            let monthRange = NSRange(location: 0, length: convertedDateString.count - 2)
            let dayRange = NSRange(location: convertedDateString.count - 2, length: 2)
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: monthRange)
            attributedString.addAttribute(.foregroundColor, value: UIColor.lightGray, range: monthRange)
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: dayRange)
            attributedString.addAttribute(.foregroundColor, value: UIColor.white,  range: dayRange)
            headerView.dateAttributeString = attributedString
            
        }
        return headerView
    }
    
    // 테이블 뷰를 눌렀을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieResult =  movieModel?.results[indexPath.section]
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.movieResult = movieResult
        present(detailVC, animated: true)
    }
}

extension NewHotViewController:UIScrollViewDelegate {
    // 스크롤 감지
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // visivleCell: 화면에 보이는 셀
        guard let visibleCells = newHotTableView.visibleCells as? [NewHotCell] else { return }
        playOrStop(positionY: 55, visibleCells: visibleCells)
    }
    
    
    func playOrStop<T>(positionY:CGFloat, visibleCells:[T]) where T : UIView & PlayOrStopType {
        guard let firstCell = visibleCells.first else { return }
        if visibleCells.count == 1 {
            // 첫번째 셀 플레이
            firstCell.moviePlay()
            return
        }
        let secondCell = visibleCells[1]
        // 포지션 컨버트
        let firstCellPositionY = newHotTableView.convert(firstCell.frame.origin, to: self.view).y
        if firstCellPositionY > positionY {
            // 첫번째 셀 플레이
            firstCell.moviePlay()
            // 나머지 정지
            var otherCells = visibleCells
            otherCells.removeFirst()
            otherCells.forEach { cell in
                cell.movieStop()
            }
        } else {
            // 두번째 셀 플레이
            secondCell.moviePlay()
            var otherCells = visibleCells
            otherCells.remove(at: 1)
            otherCells.forEach { cell in
                // 셀 정지
                cell.movieStop()
            }
        }
        
        
    }
    
}
