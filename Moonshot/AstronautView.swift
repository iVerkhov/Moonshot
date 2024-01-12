//
//  AstronautView.swift
//  Moonshot
//
//  Created by Игорь Верхов on 01.09.2023.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                    Text(astronaut.description)
                        .padding()
                }
            }
            .foregroundColor(.white)
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["armstrong"]!)
}
