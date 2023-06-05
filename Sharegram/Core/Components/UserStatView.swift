//
//  UserStatView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack{
            // MARK: - Stats value
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            // MARK: - Stats description
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 12, title: "Posts")
    }
}
