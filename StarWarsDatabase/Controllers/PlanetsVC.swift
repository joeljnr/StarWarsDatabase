//
//  PlanetsViewController.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import UIKit
import Alamofire

class PlanetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var planets = Planets()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PlanetsViewController.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor(rgb: Colors.yellow)
        return refreshControl
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Planets"
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshControl)

        activityIndicator.hidesWhenStopped = true
        
        setupViews()
                
        startLoading()
        getPlanets {
            self.finishLoading()
            self.tableView.reloadData()
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        getPlanets {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.results.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        if indexPath.row < planets.results.count {
            cell.setCell(info: planets.results[indexPath.row].name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
                
        activityIndicator.color = UIColor(rgb: Colors.yellow)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: activityIndicator)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: activityIndicator)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: tableView)
    }
    
    func getPlanets(completion: @escaping () -> Void) {
        let url = appDelegate.apiUrl + "planets"
        
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    try self.planets = jsonDecoder.decode(Planets.self, from: response.data!)
                    completion()
                } catch {
                    let alert = UIAlertController(title: "Error!", message: "Something went wrong with the data", preferredStyle: .alert)
                    print(error)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                        completion()
                    }))
                    
                    self.present(alert, animated: true)
                }
                break
            case .failure(let error):
                let alert = UIAlertController(title: "Something went wrong", message: error.errorDescription, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                    completion()
                }))
                
                self.present(alert, animated: true)
                break
            }
        }
    }
}
