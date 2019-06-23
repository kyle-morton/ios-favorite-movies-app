//
//  Movie.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/22/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import Foundation

class Movie {
    var id: String = ""
    var title: String = ""
    var year: String = ""
    var imageUrl: String = ""
    var plot: String = ""
    
    init(id: String, title: String, year: String, imageUrl: String, plot: String) {
        self.id = id
        self.title = title
        self.year = year
        self.imageUrl = imageUrl
        self.plot = plot
    }
}
