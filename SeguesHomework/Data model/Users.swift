//
//  Users.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 02.04.2021.
//

class Users {
    var users = [User(name: "Ilya",
                      surname: "Turin",
                      login: "Turin",
                      password: "qwerty",
                      aboutUser: "Alexey is the best teacher!")]
}

struct User {
    var name = ""
    var surname = ""
    var login = ""
    var password = ""
    var aboutUser = ""
}

let allUsers = Users()
