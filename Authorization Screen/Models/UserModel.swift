//
//  UserModel.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/19/21.
//

struct User {
    var login: String
    var password: String
    
    static func personData(user: User) -> Person {
       let person = Person(name: user.login,
                            surname: "Boshechka",
                            aboutPerson: "It's just my nickname, i was born in the city of Ufa, 16.01.1987 ")
        return person
    }
    
}

struct Person {
    var name: String
    var surname: String
    var aboutPerson: String
}
