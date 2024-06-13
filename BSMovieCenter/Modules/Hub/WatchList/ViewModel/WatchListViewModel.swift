//
//  WatchListViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 29/5/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

@MainActor
class WatchListViewModel : ObservableObject{
    
    @Published var movieWatchList : [Movie] = []{
        didSet{
            
            Task{
                await saveData()
            }
            
            print("movie count is \(movieWatchList.count)")
        }
    }
    
    // let watchListKey : String = "watch_list_key"
    
    
    
    
    private let db = Firestore.firestore()
    private var userId: String?
    @Published var currentUser: User?
    
    init()  {
        
        if let userId = Auth.auth().currentUser?.uid {
            self.userId = userId
            
            Task {
                await fetchUser()
            }
            
        }
        
        
    }
    
    
    func fetchUser() async {
        
        guard let userId = userId else {return}
        
        let userRef = db.collection("users").document(userId)
        
        do {
            let document = try await userRef.getDocument()
            
            if document.exists {
                self.currentUser = try document.data(as: User.self)
                self.movieWatchList = self.currentUser?.movieWatchList ?? []
                print("Fetched Data From FireStore")
            }
            else {
                print("No User Found in FireStore")
            }
            
            
        }
        catch{
            print("Error Fetchinbg Users : \(error)")
        }
        
        
        
    }
    
    
    func addMovie(movie: Movie) async {
        guard userId != nil else {
            print("User not logged in")
            return
        }
        if !movieWatchList.contains(where: { $0.id == movie.id }) {
            movieWatchList.append(movie)
            print("Movie added to watchlist")
            await saveData()
        } else {
            print("Movie already exists in watchlist")
        }
    }
    
    func deleteMovie(indexSet: IndexSet) {
        movieWatchList.remove(atOffsets: indexSet)
        Task{
            await saveData()
        }
        
    }
    
    func removeMovie(movie: Movie) async {
         guard let userId = userId else {
             print("User not logged in")
             return
         }
         movieWatchList.removeAll { $0.id == movie.id }
         print("Movie removed from watchlist")
         await updateFirestoreUser()
     }
    
    
    func updateFirestoreUser() async{
        guard let userId = userId , var currentUser = currentUser else {return}
        currentUser.movieWatchList = movieWatchList
        
        let userRef = db.collection("users").document(userId)
        
        do{
            try userRef.setData(from: currentUser)
            print("User updated in Firestore")
        }
        catch{
            print("Error updating user in Firestore: \(error)")
        }
        
    }
    
    func saveData() async {
        await updateFirestoreUser()
    }
    
    
    
    
    
    
    
    
    //MARK: - OLD User Default Implementations
    
    
    /*
     
     
     /*
      func getData(){
      
      guard
      let data = UserDefaults.standard.data(forKey: watchListKey),
      let savedData = try? JSONDecoder().decode([Movie].self, from: data)
      else{
      return
      }
      self.movieWatchList = savedData
      
      }
      */
     
     
     
     
     
     
     
     
     
     
     
     
     func getData() {
     guard let data = UserDefaults.standard.data(forKey: watchListKey) else {
     print("No data found in UserDefaults")
     return
     }
     
     do {
     self.movieWatchList = try JSONDecoder().decode([Movie].self, from: data)
     print("Loaded data from UserDefaults")
     } catch {
     print("Error decoding data: \(error)")
     }
     }
     /*
      func addMovie(movie : Movie){
      movieWatchList.append(movie)
      }
      */
     
     func addMovie(movie: Movie) {
     
     
     
     
     
     if !movieWatchList.contains(where: { $0.id == movie.id }) {
     movieWatchList.append(movie)
     print("Movie added to watchlist")
     } else {
     print("Movie already exists in watchlist")
     }
     
     
     
     }
     
     
     func deleteMovie(indexSet: IndexSet){
     movieWatchList.remove(atOffsets: indexSet)
     }
     
     func saveData(){
     
     if let encodedData = try? JSONEncoder().encode(movieWatchList){
     UserDefaults.standard.setValue(encodedData, forKey: watchListKey)
     print("Saved Data")
     }
     
     }
     
     
     */
    
    
    
    
    
    
    
    
}
