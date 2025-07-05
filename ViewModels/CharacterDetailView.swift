//
//  CharacterRowView.swift
//  Rick and Morty
//
//  Created by admin on 03/07/25.
//


import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView { // bu barcha malumotlar bu bolmasa telfonga malumotalr sigmasligi mumkin  scroll orqali barchasi korinadi
            Text(character.name)
                .font(.largeTitle) // katta harif
                .fontWeight(.bold) // qalinlashtraadi
                .padding(.top) // tepadan bosh joy
            
            VStack(alignment: .leading, spacing: 16) { // elementlarni pastga qarab joylaydi alignment leading barchasin chapga teksilaydi va 16 orsidagi bosh joy
                
                KFImage(URL(string: character.image))
                    .resizable() // olachamlarni ozgartrish mumkin shu  bolsa
                    .aspectRatio(contentMode: .fit) // rasimn keglik va balandlik nisbati
                    .frame(maxWidth: .infinity) //  bu har qanday ekranga moslashi kerak manimcha
                    .cornerRadius(20) // rasimn burchaklarin yumaloq qlish
                    .padding() // bu defoult: barcha tomonlaridan 16px
                
            
                
                Group {
                    // har birintext qlib yozib chiqanda group qlib yozgan yaxshi manimcha
                    Text("Name: \(character.name)").bold()
                    Text("Status: \(character.status)")
                    Text("Species: \(character.species)")
                    Text("Type: \(character.type.isEmpty ? "N/A" : character.type)") // bu terenary operatori ? condishin :-> true character false
                    Text("Gender: \(character.gender)")
                    Text("Origin: \(character.origin.name)")
                    Text("Location: \(character.location.name)")
                }
            }
            .padding(.horizontal)
        }
//        .navigationTitle(character.name)
    }
}

//// MARK: - Preview
//#Preview {
//    // Preview uchun namunaviy (example) Character obyektini yaratamiz
//    CharacterDetailView(character: Character(
//        id: 1,
//        name: "Rick Sanchez",
//        status: "Alive",
//        species: "Human",
//        type: "",
//        gender: "Male",
//        origin: Location(name: "Earth (C-137)", url: ""),
//        location: Location(name: "Citadel of Ricks", url: ""),
//        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//        episode: [],
//        url: "",
//        created: ""
//    ))
//}

// aagrda buni kormoqchi boinsa detailview qanday korinshun shunin ushun yozdim
