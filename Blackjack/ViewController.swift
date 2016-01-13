//
//  ViewController.swift
//  Card War
//
//  Created by Zhuo Li on 15/12/17.
//  Copyright © 2015 Zhuo Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dealerCardImageView: UIImageView!
    @IBOutlet weak var playerCardImageView: UIImageView!
    @IBOutlet weak var FirstCardView: UIImageView!
    @IBOutlet weak var SecondCardView: UIImageView!
    @IBOutlet weak var ThirdCardView: UIImageView!
    @IBOutlet weak var ForthCardView: UIImageView!
    @IBOutlet weak var FifthCardView: UIImageView!
    @IBOutlet weak var SixthCardView: UIImageView!
    @IBOutlet weak var dealerFirstCardView: UIImageView!
    @IBOutlet weak var dealerSecondCardView: UIImageView!
    @IBOutlet weak var dealerThirdCardView: UIImageView!
    @IBOutlet weak var dealerForthCardView: UIImageView!
    @IBOutlet weak var dealerFifthCardView: UIImageView!
    @IBOutlet weak var dealerSixthCardView: UIImageView!
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
    var cardIndex:Int = 0
    var cardMax:Int = 0
    var cardCounter:Int = 1
    
    // var cardNumberArray:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 1...decks {
            default_cards += one_deck
        }
        
        default_cards = default_cards.shuffle()
        print(default_cards)
        cardMax = default_cards.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonTapped(sender: UIButton) {
        if(self.playerScore == 0){
            self.FirstCardView.image = UIImage(named: "")
            self.SecondCardView.image = UIImage(named: "")
            self.ThirdCardView.image = UIImage(named: "")
            self.ForthCardView.image = UIImage(named: "")
            self.FifthCardView.image = UIImage(named: "")
            self.SixthCardView.image = UIImage(named: "")
            self.dealerFirstCardView.image = UIImage(named: "")
            self.dealerSecondCardView.image = UIImage(named: "")
            self.dealerThirdCardView.image = UIImage(named: "")
            self.dealerForthCardView.image = UIImage(named: "")
            self.dealerFifthCardView.image = UIImage(named: "")
            self.dealerSixthCardView.image = UIImage(named: "")
        }

        let dealerCardString:String = "card" + String(self.default_cards[cardIndex])
        self.dealerScore += default_cards[cardIndex]
        self.dealerScoreLable.text = String(self.dealerScore)
        cardIndex++
        if(cardIndex == cardMax){
            default_cards = default_cards.shuffle()
            cardIndex = 0
        }
        self.dealerCardImageView.image = UIImage(named: dealerCardString)
        
        let playerCardString:String = "card" + String(self.default_cards[cardIndex])
        self.playerScore += default_cards[cardIndex]
        self.playerScoreLable.text = String(self.playerScore)
        cardIndex++
        if(cardIndex == cardMax){
            default_cards = default_cards.shuffle()
            cardIndex = 0
        }
        self.playerCardImageView.image = UIImage(named: playerCardString)
        
        // Display cards
        if (self.cardCounter == 1) {
            self.FirstCardView.image = UIImage(named: playerCardString)
            self.dealerFirstCardView.image = UIImage(named: dealerCardString)
        }
        else if (self.cardCounter == 2) {
            self.SecondCardView.image = UIImage(named: playerCardString)
            self.dealerSecondCardView.image = UIImage(named: dealerCardString)
        }
        else if (self.cardCounter == 3) {
            self.ThirdCardView.image = UIImage(named: playerCardString)
            self.dealerThirdCardView.image = UIImage(named: dealerCardString)
        }
        else if (self.cardCounter == 4) {
            self.ForthCardView.image = UIImage(named: playerCardString)
            self.dealerForthCardView.image = UIImage(named: dealerCardString)
        }
        else if (self.cardCounter == 5) {
            self.FifthCardView.image = UIImage(named: playerCardString)
            self.dealerFifthCardView.image = UIImage(named: dealerCardString)
        }
        else if (self.cardCounter == 6) {
            self.SixthCardView.image = UIImage(named: playerCardString)
            self.dealerSixthCardView.image = UIImage(named: dealerCardString)
        }
        else{
            // To be handled..
        }
        self.cardCounter++
        
        // Judge cards value
        if (self.playerScore == 21) {
            self.playerCardImageView.image = UIImage(named:"iTunesArtwork")
            self.cardCounter = 1
            self.playerScore = 0
            self.dealerScore = 0
        }
        else if (self.playerScore > 21) {
            self.playerCardImageView.image = UIImage(named:"frontlable")
            self.cardCounter = 1
            self.playerScore = 0
            self.dealerScore = 0
        }
    }

}

