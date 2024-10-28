//
//  ViewController.swift
//  PropertyList
//
//  Created by 전율 on 10/27/24.
//

import UIKit

struct Development: Codable {
    let language: String
    let os: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var osLabel: UILabel!
    var urlPath: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("data").appendingPathExtension("plist")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadFromBundle(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "plist") else { return }
        guard let dict = try? NSDictionary(contentsOf: url, error: ()) as? [String:String] else { return }
        languageLabel.text = dict["language"]
        osLabel.text = dict["os"]
    }
    
    @IBAction func loadFromDocuments(_ sender: Any) {
        do {
            let data = try Data(contentsOf: urlPath)
            let decoder = PropertyListDecoder()
            let dev = try decoder.decode(Development.self, from: data)
            languageLabel.text = dev.language
            osLabel.text = dev.os
        } catch {
            print(error)
        }
    }
    
    @IBAction func saveToDocuments(_ sender: Any) {
        do {
            let dev = Development(language: "JS", os: "window")
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(dev)
            try data.write(to: urlPath)
            print("done")
            
        } catch {
            print(error)
        }
    }
    
}

