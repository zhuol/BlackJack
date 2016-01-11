//
//  ViewController.swift
//  Card War
//
//  Created by Zhuo Li on 15/12/17.
//  Copyright © 2015 Zhuo Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dealerScoreLable: UILabel!
    @IBOutlet weak var playerScoreLable: UILabel!
    
    let decks = 4
    let one_deck:[Int] = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5,
        6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10,
        11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13]
    
    var default_cards:[Int] = []
    var dealerScore:Int = 0
    var playerScore:Int = 0
    
    var cardNumberArray:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 1...decks {
            default_cards += one_deck
        }
        
        default_cards = default_cards.shuffle()
        print(default_cards)
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
        
            self.dealerScore += 1
            self.dealerScoreLable.text = String(self.dealerScore)
        
        }
        else if firstRandomNum == secondRandomNum {
            
            
        
        }
        else {
            
            self.playerScore += 1
            self.playerScoreLable.text = String(self.playerScore)
            
        }
        
    }

}

