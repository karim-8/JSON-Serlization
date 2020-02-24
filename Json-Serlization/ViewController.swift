//
//  ViewController.swift
//  Json-Serlization
//
//  Created by KARIM on 2/23/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //array of type Model to append data over then view them in table vie
    var dataArray = [Petition]()
    let url = "https://www.hackingwithswift.com/samples/petitions-1.json"
    
    
     override func viewDidLoad() {
     super.viewDidLoad()
     
     navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hello", style: .plain, target: self,
                                                         action: #selector(showAlert))
     
        performSelector(inBackground: #selector(fetchJson), with: nil)
     
     }
    
    @objc func fetchJson () {
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        //fetching data in the background using GCD
        
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                    return
                }
            }
            
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    
    //UI work must be done in the main thread
    @objc func showAlert () {
        
        DispatchQueue.main.async {
            [weak self] in
            let ac = UIAlertController(title: "Data", message: "your data is coming from \(self?.url)",
                preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self?.present(ac, animated: true)
        }
        
    }
    
    //function for parsing json code
    func parse(json:Data) {
        print("json is \(json)")
        //instance from decoder
        let decoder = JSONDecoder()
        if let jsonData = try? decoder.decode(Petitions.self, from: json) {
            dataArray = jsonData.results //appending results to array
            //UI work must be done in the main thread
           tableView.reloadData()

        }
    }
    
   @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}
