//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!
    var disposable:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    func downloadJson(_ url:String)-> Observable<String> {
        return Observable.create { emitter in
            emitter.onNext("hello world")
            emitter.onCompleted()
            return Disposables.create()
        }
        
    }
    
    // MARK: SYNC
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func onLoad() {
        editView.text = ""
        setVisibleWithAnimation(activityIndicator, true)
        // observeOn(MainScheduler.instance): 쓰레드를 변경(MainScheduler.instance으로), main queue를 감싸는게 귀찮으면 여기에 감싸면 됨
        // observeOn, subscribeOn: 쓰레드 분기
        let jsonObserverble = downloadJson(MEMBER_LIST_URL)
        let helloObserverble = Observable.just("HELLO WORLD")
            
        _ = Observable.zip(jsonObserverble, helloObserverble) {$0 + $1}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { json in
                self.editView.text = json
                self.setVisibleWithAnimation(self.activityIndicator, false)
            }, onCompleted: {
                print("finish")
            }).disposed(by: disposable) // disposed(by: disposable): bag에 이 dispose을 append
        
    }
}
