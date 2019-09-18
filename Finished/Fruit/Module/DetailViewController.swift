//
//  DetailViewController.swift
//  Fruit
//
//  Created by Cain Luo on 2019/9/18.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var furti: Fruit? {
        didSet {
            refreshUI()
        }
    }
    
    private func refreshUI() {
      loadViewIfNeeded()
      nameLabel.text = furti?.name
      descriptionLabel.text = furti?.description
      imageView.image = furti?.icon
    }
}

extension DetailViewController: FruitSelectionDelegate {
    func furitSelected(_ newFurit: Fruit) {
        self.furti = newFurit
    }
}
