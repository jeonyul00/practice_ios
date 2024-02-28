//
//  ViewController.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var networkManager = NetworkManager()
    var posts:[PostModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchPosts()
        
    }
    
    func fetchPosts() {
        networkManager.fetchSomeData { [weak self] (data, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let data = data {
                    self.posts = data
                    self.textLabel.text = "\(String(describing: self.posts!))"
                } else if let error = error {
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
        
    
    
    
}

