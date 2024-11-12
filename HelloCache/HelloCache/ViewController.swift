//
//  ViewController.swift
//  HelloCache
//
//  Created by 전율 on 11/6/24.
//

import UIKit

struct ResponseData:Codable {
    let data: Date
    let code: Int
    let message: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func withCacheControl(_ sender: Any) {
        guard let url = URL(string: "https://kxapi.azurewebsites.net/cache?apiKey=Vp3lkFGT4CyPC5t8vF8D") else { return }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let res = try JSONDecoder().decode(ResponseData.self, from: data)
                valueLabel.text = res.data.formatted(date: .omitted, time: .standard)
            } catch {
                print(error)
            }
            
        }
    }
    
    @IBAction func withoutCacheControl(_ sender: Any) {
        guard let url = URL(string: "https://kxapi.azurewebsites.net/cache/nocache?apiKey=Vp3lkFGT4CyPC5t8vF8D") else { return }
        Task {
            do {
                var request = URLRequest(url: url)
                request.cachePolicy = .returnCacheDataElseLoad
                let (data, _) = try await URLSession.shared.data(for: request)
                let res = try JSONDecoder().decode(ResponseData.self, from: data)
                valueLabel.text = res.data.formatted(date: .omitted, time: .standard)
            } catch {
                print(error)
            }
            
        }
        
    }
 
    
    @IBAction func resetCache(_ sender: Any) {
    }
    
}

