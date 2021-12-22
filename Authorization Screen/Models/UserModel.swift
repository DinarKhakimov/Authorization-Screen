//
//  UserModel.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/19/21.
//

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getPersonData() -> User {
        User(login: "Johnny", password: "777", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let aboutPerson: String
    let image: String
    
    var fullName : String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Johnny", surname: "Boshechka", aboutPerson: "It's just my nickname, i was born in the city of Ufa, 16.01.1987", image: "IMG_0264")
    }
}

