//
//  MovieDataProcessor.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/24/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import Foundation

class MovieDataProcessor {
    
    static func mapJsonToMovies(object: [String: AnyObject], moviesKey: String) -> [Movie] {
        var mappedMovies: [Movie] = []
        
        guard let movies = object[moviesKey] as? [[String: AnyObject]] else {
            return mappedMovies
        }
        
        for movie in movies {
            guard let id = movie["imdbID"] as? String,
                let name = movie["Title"] as? String,
                let year = movie["Year"] as? String,
                let imageUrl = movie["Poster"] as? String else { continue }
            
            let movieClass = Movie(id: id, title: name, year: year, imageUrl: imageUrl, plot: "")
            mappedMovies.append(movieClass)
        }
        
        return mappedMovies
    }
    
    static func write(movies: [Movie]) {
        // TODO: implement...
    }
 }
