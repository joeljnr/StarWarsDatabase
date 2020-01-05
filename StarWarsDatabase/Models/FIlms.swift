//
//  FIlms.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 04/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import Foundation

struct Films: Decodable {
    var count: Int = 0
    var next: String? = ""
    var previous: String? = ""
    var results: [Film] = [Film]()
}

struct Film: Decodable {
    var title: String = ""
    var episode_id: Int = 0
    var opening_crawl: String = ""
    var director: String = ""
    var producer: String = ""
    var release_date: String = ""
    var characters: [String] = [String]()
    var planets: [String] = [String]()
    var starships: [String] = [String]()
    var vehicles: [String] = [String]()
    var species: [String] = [String]()
    var created: String = ""
    var edited: String = ""
    var url: String = ""
}
