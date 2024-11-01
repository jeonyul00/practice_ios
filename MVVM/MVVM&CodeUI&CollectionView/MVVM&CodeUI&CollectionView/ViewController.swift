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
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()
    
    let viewModel = ViewModel()
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        bindView()
        tvTrigger.onNext(())
    }
    
    
}

// MARK: - UI
extension ViewController {
    private func setUI(){
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
    
}

// MARK: - Bind
extension ViewController {
    private func bindViewModel() {
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(), movieTrigger: movieTrigger.asObservable())
        let output = viewModel.transform(input: input)
        
        output.tvList.bind { tvList in
            print(tvList)
        }.disposed(by:dispose)
        
        output.movieResult.bind { movieResult in
            print(movieResult)
        }.disposed(by:dispose)
    }
    
    private func bindView() {
        buttonView.tvButton.rx.tap.bind { [weak self] _ in
            self?.tvTrigger.onNext(Void())
        }.disposed(by: dispose)
        
        buttonView.movieButton.rx.tap.bind { [weak self] _ in
            self?.movieTrigger.onNext(Void())
        }.disposed(by:dispose)
        
    }
}

