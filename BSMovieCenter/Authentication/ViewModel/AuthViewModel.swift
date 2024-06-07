//
//  AuthViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift



enum AuthError: LocalizedError, Equatable {
    case networkError
    case wrongCredentials
    case unknownError(String)
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Network error. Please check your internet connection."
        case .wrongCredentials:
            return "Wrong credentials. Please try again."
        case .unknownError(let message):
            return "There was an Error \(message)"
        }
    }
}


@MainActor
class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    @Published var authError: AuthError?
    
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email : String, password : String) async throws {
        print("Sign IN Called")
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("\(result)")
            self.userSession = result.user
            await fetchUser()
        }
        catch{
            handleAuthError(error)
            print("DEBUG: Failed to LOG IN with Error \(error)")
        }
        
    }
    
    func createUser(withEmail email : String, password : String, fullName : String) async throws {
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email, movieWatchList: nil)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }
        catch{
            handleAuthError(error)
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
    
    func deleteAccount() async throws {
        print("Account Deletion Called")
             
             guard let user = Auth.auth().currentUser else { return }
             
             do {
                 try await Firestore.firestore().collection("users").document(user.uid).delete()
                 try await user.delete()
                 self.userSession = nil
                 self.currentUser = nil
                 print("DEBUG: Account successfully deleted")
             } catch {
                 print("DEBUG: Failed to delete account with Error \(error)")
             }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current User is \(self.currentUser)")
    }
    
    private func handleAuthError(_ error: Error) {
      
        if let firebaseError = error as? NSError {
            
            switch firebaseError.code {
            case AuthErrorCode.networkError.rawValue:
                self.authError = .networkError
            
            case AuthErrorCode.invalidEmail.rawValue, AuthErrorCode.wrongPassword.rawValue, AuthErrorCode.invalidCredential.rawValue:
                self.authError = .wrongCredentials
                
            case AuthErrorCode.emailAlreadyInUse.rawValue:
                self.authError = .unknownError("Email already in use.")
                
            default:
                self.authError = .unknownError(error.localizedDescription)
            }
            
        }
        
    }
    
    
  
    
    
}
