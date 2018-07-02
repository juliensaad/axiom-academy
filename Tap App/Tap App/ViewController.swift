//
//  ViewController.swift
//  Tap App
//
//  Created by Julien Saad on 2018-07-02.
//  Copyright © 2018 Axiom Axiom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topCount: Int = 0
    var bottomCount: Int = 0
    var player1Score: Int = 0

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!

    func reset() {
        topCount = 0
        bottomCount = 0
        topButton.setTitle("0", for: .normal)
        bottomButton.setTitle("0", for: .normal)
    }

    @IBAction func tapTopButton(_ sender: Any) {
        topCount = topCount + 1
        topButton.setTitle(String(topCount), for: .normal)

        if topCount >= 20 {
            player1Score = player1Score + 1
            reset()
            performSegue(withIdentifier: "player1win", sender: self)
        }
    }

    @IBAction func tapBottomButton(_ sender: Any) {
        bottomCount = bottomCount + 1
        bottomButton.setTitle(String(bottomCount), for: .normal)

        if bottomCount >= 20 {
            reset()
            performSegue(withIdentifier: "player2win", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

