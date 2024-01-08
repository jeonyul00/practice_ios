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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newHotTableView.register(NewHotCell.self, forCellReuseIdentifier: "NewHotCell")
        newHotTableView.delegate = self
        newHotTableView.dataSource = self
        // 동적 높이 조절
        newHotTableView.rowHeight = UITableView.automaticDimension
        
        NetworkLayer.request(type: .movie) { model in
            self.movieModel = model
        }
    }

}

extension NewHotViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newHotTableView.dequeueReusableCell(withIdentifier: "NewHotCell", for: indexPath) as! NewHotCell
        let responseMovieResult =  self.movieModel?.results[indexPath.row]
        cell.movieResult = responseMovieResult
        return cell
    }
    
    // 셀 높이 동적 조절
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
