//
//  DetailViewController.swift
//  Books
//
//  Created by 전율 on 11/2/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = id else { return }
        APIClient.shared.fetchDetail(id) { book in
            guard book.code == 200 else { return }            
            DispatchQueue.main.async {
                self.navigationItem.title = book.data.title
                self.textView.text = book.data.summary
            }
        }
    }
}
