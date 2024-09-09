//
//  SuperHero.swift
//  SuperHeroes-iOS
//
//  Created by Mañanas on 4/9/24.
//

import Foundation

struct SuperHeroResponse: Codable{
    let response: String
    let results: [SuperHero]
}

struct SuperHero: Codable {
    let id: String
    let name: String
    let biography:Biography
    let powerstats : Powerstats
    let image: Image
}

struct Powerstats:Codable{
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct Biography:Codable{
    let realName:String
    let placeOfBirth:String
    let publisher:String
    let alignment:String
    
    enum CodingKeys:String,CodingKey{
        case publisher, alignment
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

struct Image: Codable {
    let url: String
}
