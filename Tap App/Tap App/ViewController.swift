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
    var player2Score: Int = 0

    var player1name = ""
    var player2name = ""

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    let feedbackGenerator = UIImpactFeedbackGenerator()

    func reset() {
        player1ScoreLabel.text = player1name + " " + String(player1Score)
        player2ScoreLabel.text = player2name + " " + String(player2Score)

        feedbackGenerator.prepare()
        topCount = 0
        bottomCount = 0
        topButton.setTitle("0", for: .normal)
        bottomButton.setTitle("0", for: .normal)
    }

    @IBAction func tapTopButton(_ sender: Any) {
        topCount = topCount + 1
        topButton.setTitle(String(topCount), for: .normal)
        feedbackGenerator.impactOccurred()

        if topCount >= 20 {
            saveGame(winnerName: player1name, loserName: player2name)
            player1Score = player1Score + 1
            performSegue(withIdentifier: "player1win", sender: self)
        }
    }

    @IBAction func tapBottomButton(_ sender: Any) {
        bottomCount = bottomCount + 1
        bottomButton.setTitle(String(bottomCount), for: .normal)
        feedbackGenerator.impactOccurred()

        if bottomCount >= 20 {
            saveGame(winnerName: player2name, loserName: player1name)
            player2Score = player2Score + 1
            performSegue(withIdentifier: "player2win", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        feedbackGenerator.prepare()
        reset()
    }

    
}

