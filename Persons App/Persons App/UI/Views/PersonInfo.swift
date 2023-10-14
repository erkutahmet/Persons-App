//
//  PersonInfoViewController.swift
//  Persons App
//
//  Created by Ahmet Erkut on 14.10.2023.
//

import UIKit

class PersonInfo: UIViewController {

    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personPhoneTextField: UITextField!
    
    var person: Persons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = person {
            personNameTextField.text = p.person_name
            personPhoneTextField.text = p.person_phone
        }

    }

    @IBAction func updateClicked(_ sender: Any) {
        if let personName = personNameTextField.text, let personPhone = personPhoneTextField.text, let p = person {
            update(person_id: p.person_id!, person_name: personName, person_phone: personPhone)
        }
    }
    
    func update(person_id: Int, person_name: String, person_phone: String){
        print("Save Person: \(person_id) - \(person_name) - \(person_phone)")
    }
}
