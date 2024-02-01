//
//  ViewController.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let viewModel = ViewModel()
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        bindView()
    }
    
    
    private func setUI() -> Void {
        self.view.addSubview(buttonView)
        self.view.addSubview(collectionView)
        
        buttonView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(buttonView.snp.bottom)
        }
        
    }
    
    private func bindViewModel() {
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(), movieTrigger: movieTrigger.asObservable())
        let output = viewModel.transform(input: input)
        output.tvList.bind { tvList in  print(tvList) }.disposed(by: disposeBag)
    }
    
    private func bindView() {
        buttonView.tvButton.rx.tap.bind { [weak self] in
            self?.tvTrigger.onNext(Void())
        }.disposed(by: disposeBag)
        
        buttonView.movieButton.rx.tap.bind {[weak self] in
            self?.movieTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }
    
    
    
}

