//
//  ViewController+UITableView.swift
//  Json-Serlization
//
//  Created by KARIM on 2/23/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit


extension ViewController {
    
    //numbers of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    //cell for row at == cell shape
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let arr = dataArray[indexPath.row]
        
        cell.textLabel?.text = arr.title
        cell.detailTextLabel?.text = arr.body
        return cell
    }
    
    //handle taps over each cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.detailItem = dataArray[indexPath.row].body
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
