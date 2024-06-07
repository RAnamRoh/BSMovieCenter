//
//  WatchListViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 29/5/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class WatchListViewModel : ObservableObject{
    
    
    @Published var firestore = Firestore.firestore()
    
   @Published var movieWatchList : [Movie] = []{
        didSet{
            saveData()
            print("movie count is \(movieWatchList.count)")
        }
    }
    
    let watchListKey : String = "watch_list_key"
    
    
    init() {
       getData()
    }
    
    
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
    
}
