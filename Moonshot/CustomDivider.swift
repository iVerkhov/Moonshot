//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Игорь Верхов on 02.09.2023.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
        CustomDivider()
}
