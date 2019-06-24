//
//  SearchViewController.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/23/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchText: UITextField!
    @IBOutlet var tableView: UITableView!
    
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
//                self.searchRes
            }
        }
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
