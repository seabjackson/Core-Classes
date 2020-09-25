//
//  CoreClassesViewController.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/23/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import UIKit
import Combine

class CoreClassesViewController: UIViewController {
    
    @Published var filter =  ""
    
    var filteredClasses = [CoreClasses]()
    var coreClasses = [CoreClasses]()
    
    @IBOutlet weak var displayTableView: UITableView!
    
    var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Classes"
        configureTableView()
        configureSearchController()
        fetchClasses()
    }
    
    private func configureTableView() {
        displayTableView.delegate = self
        displayTableView.dataSource = self
        displayTableView.estimatedRowHeight = 100.0
        displayTableView.rowHeight = UITableView.automaticDimension
//        displayTableView.register(CoreClassesCell.self, forCellReuseIdentifier: CoreClassesCell.reuseIdentifier)
    }
    
    //  displays search results in current view
    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    
    private func fetchClasses() {
        let networkController = NetworkController()
        let coreClassesController  = CoreClassesController(networkController: networkController)
        coreClassesController.getClasses()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't  get the classes:  \(error)")
                case .finished: break
                }
            }) { gottenClasses in
                
                self.setClasses(gottenClasses.classes)
                print(gottenClasses)
                
        }
        .store(in: &subscriptions)
    }
    
    func setClasses(_ coreClasses: [CoreClasses]) {
        self.coreClasses = coreClasses
        _ = $filter.sink { value in
            self.applyFilter(value)
        }
    }
    
    func applyFilter(_ filter: String) {
        if filter.count > 0 {
            filteredClasses =  coreClasses.filter { $0.title!.lowercased().contains(filter.lowercased()) }
        } else {
            filteredClasses = coreClasses
        }
        DispatchQueue.main.async {
            self.displayTableView.reloadData()
        }
    }
    
}

extension CoreClassesViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CoreClassesCell.reuseIdentifier, for: indexPath) as? CoreClassesCell {
        let coreClass = filteredClasses[indexPath.row]
        cell.configureWith(coreClass)
        return cell
        }
      return UITableViewCell()
    }
    
    
}


extension CoreClassesViewController: UITableViewDelegate {
    
}

extension CoreClassesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchedText  = searchController.searchBar.text {
            filter = searchedText
            applyFilter(filter)
        } else {
            filter = ""
        }
    }
}
