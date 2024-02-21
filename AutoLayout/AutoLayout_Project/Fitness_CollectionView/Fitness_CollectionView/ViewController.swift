//
//  ViewController.swift
//  Fitness_CollectionView
//
//  Created by jhlee on 2023/08/08.
//

import UIKit


class ViewController: UIViewController {

    var planList: [PlanList]?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.dataSource = self
            collectionView.delegate = self
                  
            let layout = UICollectionViewFlowLayout()

            let width = UIScreen.main.bounds.width - 40

            layout.itemSize = CGSize(width: width, height: 150)
            layout.minimumLineSpacing = 20
            collectionView.collectionViewLayout = layout
            
 
            
            

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        self.navigationItem.title  = "Fitness App"
        
        loadJsonData()
        
    }
    
    private func loadJsonData() {
        guard let plans = plans else {
            return
        }
        
        let decoder = JSONDecoder()
        
        do{
            self.planList = try decoder.decode([PlanList].self, from: plans)
            collectionView.reloadData()
            
            
        }catch{
            print("디코딩 에러")
        }
        
        
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.planList?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FitnessCell", for: indexPath) as! FitnessCell
        
        cell.fitnessTitle.text = planList?[indexPath.item].planType
        
        if let imageName = planList?[indexPath.item].imageName {
            let img = UIImage(named: imageName)
            cell.bgImageView.image = img

        }
        
        
        return cell
                
    }
    
    
}

