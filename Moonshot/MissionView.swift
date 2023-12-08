//
//  MissionView.swift
//  Moonshot
//
//  Created by Игорь Верхов on 01.09.2023.
//

import SwiftUI

struct MissionView: View {
    var mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader {geometry in
                ScrollView {
                    VStack {
                        Image(decorative: mission.image)
                            .resizable()
                            .scaledToFit()
                        //                        .containerRelativeFrame(.horizontal) { size, axis in
                        //                            size * 0.6
                    }
                    //                        .frame(maxWidth: geometry.size.width * 0.6)
                    .padding(.top)
                    //                        .accessibilityLabel(mission.badge)
                    
                    if let date = mission.launchDate {
                        Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                            .padding(.top)
                    }
                    
                    VStack(alignment: .leading) {
                        CustomDivider()
                        
                        Text("Mission Highligths")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewRoster(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[3], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
