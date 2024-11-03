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
    var link: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = id else { return }
        APIClient.shared.fetchDetail(id) { book in
            guard book.code == 200 else { return }
            DispatchQueue.main.async {
                self.navigationItem.title = book.data.title
                self.textView.text = book.data.summary
                self.link = book.data.storeLink
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LinkViewController {
            vc.url = link
        }
    }
}
