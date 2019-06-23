//
//  ViewController.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/21/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteMovies: [Movie] = []
    
    @IBOutlet var mainTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    /**
    * foreach cell in movietableView, bind to values from same indexed element in favoriteMovies
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let index: Int = indexPath.row
        
        movieCell.movieTitle.text = favoriteMovies[index].title
        movieCell.movieYear.text = favoriteMovies[index].year
        displayMovieImage(index: index, movieCell: movieCell)
        
        return movieCell
    }
    
    func displayMovieImage(index: Int, movieCell: CustomTableViewCell) {
        let url = (URL(string: favoriteMovies[index].imageUrl)?.absoluteURL)!
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                movieCell.movieImage.image = image
            }
            
        }).resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if (favoriteMovies.count == 0) {
            favoriteMovies.append(Movie(id: "12345", title: "Star Wars", year: "1977", imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/8/87/StarWarsMoviePoster1977.jpg/220px-StarWarsMoviePoster1977.jpg", plot: ""))
        }
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

