//
//  CharacterListView.swift
//  Rick and Morty
//
//  Created by admin on 27/06/25.
//



import SwiftUI
import Kingfisher

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.characters.indices, id: \.self) { index in
                let character = viewModel.characters[index] // Character'ni to'g'ri aniqlash
                NavigationLink(destination: CharacterDetailView(character: character)) { // bunda ustiga bosish mumlin detail ochiladi
                    
                    HStack(alignment: .center) { //raqam ortada turdi va index +1 q dan boshalb ketadi yoqsa index har doim 0 dan boshladni
                        Text("\(index + 1)")
                            .bold()
                        KFImage(URL(string: character.image))
                            .resizable() // rasim moslashuvchan
                            .frame(width: 80, height: 80) // rasim razmeri
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline) // simlar katta harfda
                            Text(character.species)
                            Text(character.status) // qayerdan klegani nomi va rangi
                                .foregroundColor(.green)
                            Text(character.origin.name)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Rick and Morty")
            .onAppear {
                viewModel.loadCharacters()
            }
        }
    }
}
#Preview {
    CharacterListView()
}

    

