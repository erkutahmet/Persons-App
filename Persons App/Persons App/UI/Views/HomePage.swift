//
//  ViewController.swift
//  Persons App
//
//  Created by Ahmet Erkut on 14.10.2023.
//

import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func detailButton(_ sender: Any) {
        let p = Persons(person_id: 1, person_name: "Erkut", person_phone: "11111")
        performSegue(withIdentifier: "toInfo", sender: p)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfo" {
            if let person = sender as? Persons {
                let toVC = segue.destination as! PersonInfo
                toVC.person = person
            }
        }
    }
    
}

