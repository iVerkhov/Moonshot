//
//  HorizontalScroll.swift
//  Moonshot
//
//  Created by Игорь Верхов on 02.09.2023.
//

import SwiftUI

struct CrewRoster: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink() {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(.capsule)
                            .overlay(
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                                .accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
                            
                            Text(crewMember.role)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationDestination(for: Astronaut.self) {astronaut in
            AstronautView(astronaut: astronaut)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return CrewRoster(crew: [
        MissionView(mission: missions[0], astronauts: astronauts).crew[0],
        MissionView(mission: missions[0], astronauts: astronauts).crew[1],
        MissionView(mission: missions[0], astronauts: astronauts).crew[2],
    ])
    .background(.darkBackground)
}

