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
    let personDetailVM = PersonDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInfoUI()
    }
    
    func setInfoUI() {
        if let p = person {
            personNameTextField.text = p.person_name
            personPhoneTextField.text = p.person_phone
        }
    }

    @IBAction func updateClicked(_ sender: Any) {
        if let personName = personNameTextField.text, let personPhone = personPhoneTextField.text, let p = person {
            personDetailVM.personDetailUpdate(person_id: p.person_id!, person_name: personName, person_phone: personPhone)
        }
        navigationController?.popToRootViewController(animated: true)
    }
}
