//
//  GameData.swift
//  Tap App
//
//  Created by Julien Saad on 2018-07-06.
//  Copyright © 2018 Axiom Axiom. All rights reserved.
//

import Foundation

func savePlayer1Name(name: String) {
    let defaults = UserDefaults.standard
    defaults.set(name, forKey: "player1")
}

func getPlayer1Name() -> String {
    if let playerName = UserDefaults.standard.string(forKey: "player1") {
        return playerName
    }
    else {
        return "Player 1"
    }
}

func savePlayer2Name(name: String) {
    let defaults = UserDefaults.standard
    defaults.set(name, forKey: "player2")
}

func getPlayer2Name() -> String {
    if let playerName = UserDefaults.standard.string(forKey: "player2") {
        return playerName
    }
    else {
        return "Player 2"
    }
}

func saveGame(winnerName: String, loserName: String) {
    let gameName = "\(winnerName) — \(loserName)"

    var matches = getGameHistory()
    matches.append(gameName)

    let defaults = UserDefaults.standard
    defaults.set(matches, forKey: "winners")
}

func getGameHistory() -> [String] {
    let matches = UserDefaults.standard.stringArray(forKey: "winners") ?? [String]()
    return matches
}
