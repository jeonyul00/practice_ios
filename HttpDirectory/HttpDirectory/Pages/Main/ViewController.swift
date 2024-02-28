//
//  ViewController.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var tableView: UITableView!
    let disposeBag = DisposeBag()
    var viewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bindViewModel()
    }
    
    // table ui
    func setTableView() -> Void {
        tableView = UITableView(frame: view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    // 옵저버
    func bindViewModel(){
        viewModel.posts.observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")){
            _,post, cell in cell.textLabel?.text = post.title
        }.disposed(by: disposeBag)
    }
    
}

