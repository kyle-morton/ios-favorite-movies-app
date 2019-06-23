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
