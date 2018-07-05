//
//  LeaderboardViewController.swift
//  Tap App
//
//  Created by Julien Saad on 2018-07-05.
//  Copyright © 2018 Axiom Axiom. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    var fruits = ["🍌", "🍎", "🍑", "🍇", "🍐", "🍉"]

    override func viewDidLoad() {
        super.viewDidLoad()

        fruits = shuffled(array: fruits)
    }

    func shuffled(array: [String]) -> [String] {
        var randomizedIndexes: [Int] = []

        for _ in 0 ..< array.count {
            var newIndex = Int(arc4random()) % array.count
            while randomizedIndexes.contains(newIndex) {
                newIndex = Int(arc4random()) % array.count
            }
            randomizedIndexes.append(newIndex)
        }

        var shuffledObjects: [String] = []
        for index in randomizedIndexes {
            shuffledObjects.append(array[index])
        }

        return shuffledObjects
    }

    // MARK : UITableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "match", for: indexPath) as! MatchTableViewCell

        if indexPath.row == 0 {
            cell.matchImage.image = #imageLiteral(resourceName: "poutine")
        }
        else {
            cell.matchImage.image = #imageLiteral(resourceName: "Icon")
        }

        cell.textLabel?.textColor = UIColor(red: 144/255, green: 154/255, blue: 23/255, alpha: 1.0)
        cell.textLabel?.text = fruits[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
