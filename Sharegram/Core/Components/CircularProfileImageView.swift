//
//  CircularProfileImageView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/09/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small:
            return 48
        case .medium:
            return 56
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user : User
    let size: ProfileImageSize
    
    var body: some View {
        if let iurl = user.profileImageURL {
            KFImage(URL(string: iurl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension,
                       height: size.dimension
                )
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension,
                       height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(.purple)
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .medium)
    }
}
