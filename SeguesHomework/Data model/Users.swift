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
                      aboutUser: "Hey! My name is Ilya and I am 23 years old. Until recently, I was a public procurement specialist, but I quit my job a couple of months ago. I decided that I needed to change my profession to a more promising one and, most importantly, one that gives pleasure! That is why I am here.",
                      hobbies: "I love IT and everything related to it. Phones, computers, startups, new technologies, cool products and people. I also love reading technical documentation and programming)",
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
