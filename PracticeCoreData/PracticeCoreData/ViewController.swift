//
//  ViewController.swift
//  PracticeCoreData
//
//  Created by 전율 on 10/28/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextFiled: UITextField!
    var editTarget: NSManagedObject?
    var context: NSManagedObjectContext {
        guard let app = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        return app.persistentContainer.viewContext
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func createEntity(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let strAge = ageTextFiled.text, let age = Int(strAge) else { return }
        
        // 엔티티 생성 -> 컨텍스트에 임시 객체 저장
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        
        // 데이터 생성
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        
        // 변경된 내용이 있으면 컨텍스트에 저장
        if context.hasChanges {
            do {
                try context.save()
                nameTextField.text = ""
                ageTextFiled.text = ""
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func readEntity(_ sender: Any) {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let list = try context.fetch(request)
            
            if let first = list.first {
                nameTextField.text = first.value(forKey: "name") as? String
                ageTextFiled.text = "\(first.value(forKey: "age") as? Int ?? 0)"
                editTarget = first
            } else {
                print("empty data")
            }
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func updateEntity(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let strAge = ageTextFiled.text, let age = Int(strAge) else { return }
        
        if let editTarget {
            editTarget.setValue(name, forKey: "name")
            editTarget.setValue(age, forKey: "age")
        }
        
        if context.hasChanges {
            do {
                try context.save()
                nameTextField.text = ""
                ageTextFiled.text = ""
            } catch {
                print(error)
            }
        }

    }
    
    @IBAction func deleteEntity(_ sender: Any) {
        if let editTarget {
            context.delete(editTarget)
        }
        if context.hasChanges {
            do {
                try context.save()
                nameTextField.text = ""
                ageTextFiled.text = ""
            } catch {
                print(error)
            }
        }


    }
    
}

