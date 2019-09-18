//
//  MasterViewController.swift
//  Fruit
//
//  Created by Cain Luo on 2019/9/18.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

import UIKit

protocol FruitSelectionDelegate: class {
    func furitSelected(_ newFurit: Fruit)
}

class MasterViewController: UITableViewController {
    
    let fruits = [
        Fruit(name: "Apple", description: "这是苹果", iconName: "Apple", fruitType: .apple),
        Fruit(name: "Banana", description: "这是香蕉", iconName: "Banana", fruitType: .banana),
        Fruit(name: "Blackberry", description: "这是黑莓", iconName: "Blackberry", fruitType: .blackberry),
        Fruit(name: "Cherries", description: "这是樱桃", iconName: "Cherries", fruitType: .cherries),
        Fruit(name: "Coconut", description: "这是椰子", iconName: "Coconut", fruitType: .coconut),
        Fruit(name: "Grapes", description: "这是葡萄", iconName: "Grapes", fruitType: .grapes)
    ]

    weak var delegate: FruitSelectionDelegate?

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
        let fruti = fruits[indexPath.row]
        
        cell.textLabel?.text = fruti.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFruits = fruits[indexPath.row]
        
        delegate?.furitSelected(selectedFruits)
        
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
}
