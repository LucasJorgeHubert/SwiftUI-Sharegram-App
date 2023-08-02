//
//  CompleteSignUp.swift
//  Sharegram
//
//  Created by Lucas Hubert on 24/07/23.
//

import SwiftUI

struct CompleteSignUp: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Wellcome to Sharegram")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your account must be created in seconds.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                print("Complete Sign Up")
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemIndigo).opacity(0.8))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignUp_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUp()
    }
}
