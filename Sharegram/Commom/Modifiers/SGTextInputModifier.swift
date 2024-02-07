//
//  SGTextInputModifier.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/06/23.
//

import Foundation
import SwiftUI

struct SGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemIndigo).opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
