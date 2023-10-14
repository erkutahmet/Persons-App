//
//  PersonRegistrationViewController.swift
//  Persons App
//
//  Created by Ahmet Erkut on 14.10.2023.
//

import UIKit

class PersonRegistration: UIViewController {

    
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personPhoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if let personName = personNameTextField.text, let personPhone = personPhoneTextField.text {
            save(person_name: personName, person_phone: personPhone)
        }
    }
    
    func save(person_name: String, person_phone: String){
        print("Save Person: \(person_name) - \(person_phone)")
    }
    
}
