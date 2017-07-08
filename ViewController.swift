//
//  ViewController.swift
//  newTicTacToe
//
//  Created by Yifan Lou on 7/5/17.
//  Copyright © 2017 Yifan Lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    var activePlayer = 1

    
    @IBOutlet weak var label: UILabel!
    @IBAction func button(_ sender: AnyObject)
    {
        if gameState[sender.tag-1] == 0 && gameIsActive == true{
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1{
                sender.setImage(UIImage(named: "cross.png"), for:UIControlState())
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named:"nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        // winning 
        for combination in winningCombination{
            if gameState[combination[0]] != 0 &&  gameState[combination[0]] ==  gameState[combination[1]] &&  gameState[combination[1]] ==  gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1{
                    label.text = "corss has won!"
                }else{
                    label.text = "nought has won!"
                }
                playAgainOutlet.isHidden = false
                label.isHidden = false
            }
        }
        //tie
        gameIsActive = false
        for i in gameState{
            
            if i == 0{
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            label.text = "It's a tie"
            playAgainOutlet.isHidden = false
            label.isHidden = false
        }
 
        
    }
    
    
    @IBOutlet weak var playAgainOutlet: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        gameIsActive = true
        
        playAgainOutlet.isHidden = true
        label.isHidden = true
        
        //clear a board
        for i in 1...9
        {
            let button: UIButton = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

