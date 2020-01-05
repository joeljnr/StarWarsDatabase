//
//  Character.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import Foundation

struct Characters: Decodable {
    var count: Int = 0
    var next: String? = ""
    var previous: String? = ""
    var results: [Character] = [Character]()
}

struct Character: Decodable {
    var name: String = ""
    var height: String = ""
    var mass: String = ""
    var hair_color: String = ""
    var skin_color: String = ""
    var eye_color: String = ""
    var birth_year: String = ""
    var gender: String = ""
    var homeworld: String = ""
    var created: String = ""
    var edited: String = ""
    var url: String = ""
    var films: [String] = [String]()
    var species: [String] = [String]()
    var vehicles: [String] = [String]()
    var starships: [String] = [String]()
}
