//
//  ContentView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = contentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
