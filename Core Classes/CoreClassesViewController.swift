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
    let cellIdentifier = "CellIdentifier"
    var filteredClasses = [CoreClasses]()
    var coreClasses = [CoreClasses]()
    
    @IBOutlet weak var displayTableView: UITableView!
    
   
    var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTableView.delegate = self
        displayTableView.dataSource = self
        displayTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        fetchClasses()
        
        
        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = filteredClasses[indexPath.row].title  ?? ""
        return cell
    }
    
    
}


extension CoreClassesViewController: UITableViewDelegate {
    
}
