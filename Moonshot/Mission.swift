//
//  Mission.swift
//  Moonshot
//
//  Created by Игорь Верхов on 23.08.2023.
//

import Foundation

struct Mission: Codable, Hashable, Identifiable {
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
//    let badge: String
    
    var displayName: String {
        "Appollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
