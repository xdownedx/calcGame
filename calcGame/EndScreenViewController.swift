//
//  EndScreenViewController.swift
//  calcGame
//
//  Created by Максим Лисицкий on 22.03.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {
    
    var score:Int = 0
    
    @IBOutlet weak var ScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel.text="Вы набрали \(score) очков"
    }
    
    
}
