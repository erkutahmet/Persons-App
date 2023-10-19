//
//  HomePageViewModel.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    let pRepo = PersonsDaoRepository()
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    init() {
        copyDatabase()
        self.personsList = pRepo.personsList
        reloadPersons()
    }
    
    func personDelete(person_id: Int) {
        pRepo.personDelete(person_id: person_id)
    }
    
    func searchTextDidChange(searchText: String) {
        pRepo.searchTextDidChange(searchText: searchText)
    }
    
    func reloadPersons() {
        pRepo.reloadPersons()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "guide", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("guide.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: placeToCopy.path) {
            print("It already have DataBase")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch {}
        }
    }
}
