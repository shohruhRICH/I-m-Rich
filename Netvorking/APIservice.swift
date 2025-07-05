//
//  APIservice.swift
//  Rick and Morty
//
//  Created by admin on 27/06/25.
//

import Foundation


class APIservice {
    static let shared = APIservice()
    private init() {}
    // umumiy foydalnish uchun tashqaridan APIservice deb objek yasay olmaydi. faqatgia   (shared) orqlik ishlaydi
    
    
    //@escaping func bajarilgandan kegin ham ishlaydi
    // Result<Success, Failure>  muvafaqiyat yokida hato
    // [Character] model file dagi charakter va CharacterResponse fa ham charakterdan resul bilan foydalinsh mumkin
    // error xatolik
    // void xechnarsa qaytarmaydi
    
    func fetchCharacters( completion: @escaping (Result<[Character], Error>) ->Void) {
        let link = "https://rickandmortyapi.com/api/character"
        
        
        // ulr ozgarmas va un URL linkni oldi va internet manzilga aylantiradi
        guard let url = URL(string: link) else {
            print("LInk xato")
            return
        }
        
        
        // internetan malumot olob keladi
        // URLSession apllni internet bilan ishlaydigan vositasi ekan bu
        // sharedi apiseriga berilgan nom
        // dataTask internetan malumot olish
        // with qaysi manzildan olish kerak
        // {data, _, error bu yerda javob keladi  data olingan malumot  error xato(agarda bolsa)
        // dataTask faqat yaratiladi, lekin .resume() bo‘lmasa u hech qachon ishga tushmaydi!
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let xato = error {
                completion(.failure(xato))  // xato bor yoqligin tekshiradi (yani internet serverni)
            }
            
            guard let malumot = data  else{  // server javob bermasa data bosh bolish mumkin
                return
            }
            
            do {
                //internetan kelgan malumotni oqydi
            
                let decoder = JSONDecoder() // JSON di oqydi yani javascrip bolish kerak manimcha
                let javob = try decoder.decode(CharacterResponse.self, from: malumot)
                completion(.success(javob.results))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

