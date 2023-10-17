//
//  ViewController.swift
//  Persons App
//
//  Created by Ahmet Erkut on 14.10.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personsTableView: UITableView!
    
    var personsList = [Persons]()
    let homePageVM = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setPersonList()
    }
    
    private func setPersonList() {
        _ = homePageVM.personsList.subscribe(onNext: { list in
            self.personsList = list
            self.personsTableView.reloadData()
        })
    }
    
    private func setUpUI() {
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePageVM.reloadPersons()
    }
}

extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePageVM.searchTextDidChange(searchText: searchText)
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = personsTableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        cell.personNameLabel.text = personsList[indexPath.row].person_name
        cell.personPhoneLabel.text = personsList[indexPath.row].person_phone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toInfo", sender: personsList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfo" {
            if let data = sender as? Persons {
                let toVC = segue.destination as! PersonInfo
                toVC.person = data
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let person = self.personsList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Do you wanna delete \(person.person_name!)", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let okayAction = UIAlertAction(title: "Okay", style: .destructive) { action in
                self.homePageVM.personDelete(person_id: person.person_id!)
            }
            alert.addAction(okayAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
