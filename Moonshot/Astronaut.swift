//
//  Astronaut.swift
//  Moonshot
//
//  Created by Игорь Верхов on 23.08.2023.
//

import Foundation

struct Astronaut: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
}
