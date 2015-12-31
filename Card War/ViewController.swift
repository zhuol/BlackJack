//
//  ViewController.swift
//  Card War
//
//  Created by Hang Li on 15/12/17.
//  Copyright © 2015 Hang Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!

    
    @IBOutlet weak var player1ScoreLable: UILabel!
    
    var player1Score:Int = 0
    
    
    @IBOutlet weak var player2ScoreLable: UILabel!
    
    var player2Score:Int = 0
    
    
    var cardNumberArray:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonTapped(sender: UIButton) {
        
        let firstRandomNum = Int(arc4random_uniform(13))
        
        let firstCardString:String = self.cardNumberArray[firstRandomNum]
        
        let secondRandomNum = Int(arc4random_uniform(13))
        
        let secondCardString:String = self.cardNumberArray[secondRandomNum]
        
        
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        if firstRandomNum > secondRandomNum {
        
            self.player1Score += 1
            self.player1ScoreLable.text = String(self.player1Score)
        
        }
        else if firstRandomNum == secondRandomNum {
            
            
        
        }
        else {
            
            self.player2Score += 1
            self.player2ScoreLable.text = String(self.player2Score)
            
        }
        
    }

}

