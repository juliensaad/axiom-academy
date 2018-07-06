//
//  HomeViewController.swift
//  Tap App
//
//  Created by Julien Saad on 2018-07-05.
//  Copyright © 2018 Axiom Axiom. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var player2textField: UITextField!
    @IBOutlet weak var player1textField: UITextField!

    // MARK: - Navigation

    override func viewDidLoad() {
        super.viewDidLoad()

        player1textField.text = getPlayer1Name()
        player2textField.text = getPlayer2Name()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            if let name = player1textField.text {
                savePlayer1Name(name: name)
                destination.player1name = name
            }
            if let name = player2textField.text {
                savePlayer2Name(name: name)
                destination.player2name = name
            }
        }
    }


}
