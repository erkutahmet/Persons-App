//
//  PersonsDaoRepository.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class PersonsDaoRepository {
    
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("guide.sqlite")
        
        db = FMDatabase(path: databaseURL.path())
    }
    
    func personRegister(person_name: String, person_phone: String) {
        db?.open()
        do {
            if person_name != String() && person_phone != String(){
                try db!.executeUpdate("INSERT INTO persons (person_name, person_phone) VALUES(?,?)", values: [person_name,person_phone])
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func personDetailUpdate(person_id: Int, person_name: String, person_phone: String) {
        db?.open()
        do {
            if person_name != String() && person_phone != String(){
                try db!.executeUpdate("UPDATE persons SET person_name = ?, person_phone = ? WHERE person_id = ?", values: [person_name, person_phone, person_id])
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func personDelete(person_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM persons WHERE person_id = ?", values: [person_id])
            reloadPersons()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchTextDidChange(searchText: String) {
        db?.open()
        var list = [Persons]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM persons WHERE person_name LIKE '%\(searchText)%'", values: nil)
            
            while rs.next() {
                let person = Persons(person_id: Int(rs.string(forColumn: "person_id"))!,
                                     person_name: rs.string(forColumn: "person_name")!,
                                     person_phone: rs.string(forColumn: "person_phone")!)

                list.append(person)
            }
            
            personsList.onNext(list) //trigger
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func reloadPersons() {
        db?.open()
        var list = [Persons]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM persons", values: nil)
            
            while rs.next() {
                let person = Persons(person_id: Int(rs.string(forColumn: "person_id"))!,
                                     person_name: rs.string(forColumn: "person_name")!,
                                     person_phone: rs.string(forColumn: "person_phone")!)

                list.append(person)
            }
            
            personsList.onNext(list) //trigger
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
