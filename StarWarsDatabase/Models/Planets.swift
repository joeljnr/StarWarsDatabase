//
//  Planets.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 04/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import Foundation

struct Planets: Decodable {
    var count: Int = 0
    var next: String? = ""
    var previous: String? = ""
    var results: [Planet] = [Planet]()
}

struct Planet: Decodable {
    var name: String = ""
    var rotation_period: String? = ""
    var orbital_period: String? = ""
    var diameter: String? = ""
    var gravity: String? = ""
    var terrain: String? = ""
    var surface_water: String? = ""
    var population: String? = ""
    var residents: [String]? = [String]()
    var films: [String] = [String]()
    var created: String = ""
    var edited: String = ""
    var url: String = ""
}
