//
//  ProfileScreen.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//
import SwiftUI

struct ProfileView: View {
    @ObservedObject private var profileViewModel = ProfileViewModel()
    
    @State private var showModal = false
    @State private var modalMessage = ""
    
    let userId: String
    
    var body: some View {
        VStack {
            if profileViewModel.state.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                Text("Profile Screen")
                    .font(.title)
                
                Button("Load User Info") {
                    profileViewModel.setEvent(.onGetUserById(userId: userId))
                }
            }
        }
        .onAppear {
            profileViewModel.setEvent(.onGetUserById(userId: userId))
        }
        .onReceive(profileViewModel.$effect) { newEffect in
            if let effect = newEffect {
                handleEffect(effect)
            }
        }
        .alert(isPresented: $showModal) {
            Alert(title: Text("Info"), message: Text(modalMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func handleEffect(_ effect: ProfileEffect) {
        switch effect {
        case .navigate(let destination):
            print("Navigate to: \(destination)")
        case .showModal(let message):
            modalMessage = message
            showModal = true
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: "123")
    }
}

