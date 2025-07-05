//
//  Character.swift
//  Rick and Morty
//
//  Created by admin on 27/06/25.
//

import Foundation

// CharacterResponse umumiy javob uchun
// bu APi dan kelgan javobni : info va result
struct CharacterResponse: Codable {
    let results: [Character]
}


// character har bir qaharmaon uchun ishlatiladi va results yani [CharacterResponse] dagi results esa array ichidagi har bir qaharamonlar

struct Character: Codable, Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}

// origin va location uchun umumi tuzilma
struct Location: Codable {
    let name: String
    let url: String
}

