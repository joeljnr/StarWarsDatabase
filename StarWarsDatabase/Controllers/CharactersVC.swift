//
//  CharactersViewController.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import UIKit
import Alamofire

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var characters = [Character]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Characters"
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        setupViews()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.setCell(info: "Teste")
        return cell
    }
    
    func setupViews() {
        view.addSubview(tableView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: tableView)
    }
    
    func getCharacters() {
        let url = appDelegate.apiUrl + "people"
        
    }
}
