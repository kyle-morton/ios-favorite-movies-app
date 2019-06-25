//
//  SearchViewController.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/23/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var searchText: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var searchResults: [Movie] = []
    
    @IBAction func search(sender: UIButton) {
        print("Searching...")
        let searchTerm = searchText.text
        if searchTerm!.count > 2 {
            retrieveMoviesByTerm(searchTerm: searchTerm!)
        }
    }
    
    func retrieveMoviesByTerm(searchTerm: String) {
        let url = "https://fake-movie-database-api.herokuapp.com/api?s=\(searchTerm)&type=movie&r=json"
        
        HttpHandler.getJson(urlString: url, completionHandler: parseDataIntoMovies)
    }
    
    func parseDataIntoMovies(data: Data?) -> Void {
        if let data = data {
            let object = JSONParser.parse(data: data)
            
            if let object = object {
                self.searchResults = MovieDataProcessor.mapJsonToMovies(object: object, moviesKey: "Search")
//                self.searchRes
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    /**
     * foreach cell in movietableView, bind to values from same indexed element in favoriteMovies
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let index: Int = indexPath.row
        
        movieCell.movieTitle.text = searchResults[index].title
        movieCell.movieYear.text = searchResults[index].year
        displayMovieImage(index: index, movieCell: movieCell)
        
        return movieCell
    }
    
    func displayMovieImage(index: Int, movieCell: CustomTableViewCell) {
        let url = (URL(string: searchResults[index].imageUrl)?.absoluteURL)!
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
