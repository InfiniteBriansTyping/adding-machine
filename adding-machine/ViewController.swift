//
//  ViewController.swift
//  adding-machine
//
//  Created by Brian Kress on 11/29/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    var maxSum:Int = 200
    var currentSum:Int = 0
    var multiplier:Int = 0
    var newSum:Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var whichNumText: UITextField!
    
    @IBOutlet weak var numOutput: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    //Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if whichNumText.text != nil && whichNumText.text != "" {
            
            logoImg.hidden = true
            playBtn.hidden = true
            whichNumText.hidden = true
            
            numOutput.hidden = false
            addBtn.hidden = false
            
            multiplier = Int(whichNumText.text!)!
        }
    }
    
    @IBAction func onAddTap(sender: UIButton!) {
        currentSum = newSum
        newSum += multiplier
        updateSum()
        
        if isGameOver() {
            restartGame()
        }
    }

    func restartGame() {
        multiplier = 0
        newSum = 0
        currentSum = 0
        whichNumText.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        whichNumText.hidden = false
        
        numOutput.hidden = true
        addBtn.hidden = true
    }
    
    func isGameOver() -> Bool {
        if newSum >= maxSum {
            return true
        }
        return false
    }
    
    func updateSum() {
        numOutput.text = "\(currentSum) + \(multiplier) = \(newSum)"
    }

}

