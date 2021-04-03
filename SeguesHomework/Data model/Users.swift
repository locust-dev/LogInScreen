//
//  Users.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 02.04.2021.
//

class Users {
    // Added default user
    var users = [User(name: "Ilya",
                      surname: "Turin",
                      login: "Turin",
                      password: "qwerty",
                      aboutUser: "Hi, My name is Ilya! I am 23 years old. I love programming.",
                      hobbies: "Swimming, running, reading",
                      photo: "MyPhoto")]
}

struct User {
    var name = ""
    var surname = ""
    
    var login = ""
    var password = ""
    
    var aboutUser = ""
    var hobbies = ""
    
    var photo = ""
}

let allUsers = Users()
