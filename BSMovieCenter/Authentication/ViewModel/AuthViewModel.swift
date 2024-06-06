//
//  AuthViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email : String, password : String) async throws {
        print("Sign IN")
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }
        catch{
            print("DEBUG: Failed to LOG IN with Error \(error.localizedDescription)")
        }
        
    }
    
    func createUser(withEmail email : String, password : String, fullName : String) async throws {
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }
        catch{
            print("DEBUG: Failed to Create Account with Error \(error.localizedDescription)")
        }
        
    }
    
    func signOut(){
        print("Sign Out")
        
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }
        catch{
            print("DEBUG: Failed to sign Out")
        }
        
    }
    
    func deleteAccount(){
        print("Account Deleted")
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current User is \(self.currentUser)")
    }
    
}
