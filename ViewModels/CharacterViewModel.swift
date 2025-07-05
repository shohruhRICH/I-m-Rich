//
//  File.swift
//  Rick and Morty
//
//  Created by admin on 02/07/25.
//

import Foundation

class CharacterViewModel: ObservableObject {

    // Ekranga chiqadigan character'lar
    @Published var characters: [Character] = []

    // API'dan character'larni olib kelish malumot
    func loadCharacters() {
        APIservice.shared.fetchCharacters { result in  // api dan keldi
            switch result {
                case .success(let list):
                DispatchQueue.main.async { // ui ni yanglanishuchun kerak
                        self.characters = list
                }
                case .failure(let xato):
                    print("Xatolik: \(xato)") //api xatolik beradi
            }
        }
    }
}

