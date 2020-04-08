//
//  ViewController.swift
//  memoryTheGame
//
//  Created by ViTo on 29/03/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//

import UIKit

class GameViewContoller: UIViewController {

    
    
    
    @IBOutlet weak var cardBtn1: UIButton!
    @IBOutlet weak var cardBtn2: UIButton!
    @IBOutlet weak var cardBtn3: UIButton!
    @IBOutlet weak var cardBtn4: UIButton!
    @IBOutlet weak var cardBtn5: UIButton!
    @IBOutlet weak var cardBtn6: UIButton!
    @IBOutlet weak var cardBtn7: UIButton!
    @IBOutlet weak var cardBtn8: UIButton!
    @IBOutlet weak var cardBtn9: UIButton!
    
    
    
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var startBtn: CircleButton!
    @IBOutlet weak var saveBtn: CircleButton!
    
    @IBAction func saveBtn(_ sender: Any) {
        performSegue(withIdentifier: "SaveScoreController", sender: score)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SaveScoreController" {
            let vc = segue.destination as! SaveScoreViewController
            vc.finalScore = score
        }
    }
    
    
    
           
    var cardList: [Card] = []
    var imgList: [String] = []
    
    var timerStart: Bool = false
    var correctAnswer: Bool = false
    
    @IBAction func startBtn(_ sender: UIButton) {
        letsPlay()
        sender.isUserInteractionEnabled = false
        
    }
    
    var score: Int = 0 {
        didSet {
            Points.text = "Score: " + "\(score)"
        }
    }
    
    @IBAction func btnClick(_ sender: UIButton) {

        sender.setImage(UIImage(named: getImage(btn: sender)), for: .normal)
        
        if(getImage(btn: sender) == cardList[8].image) {
            score += 7
            correctAnswer = true
        }
        else {
            timerStart = true
            score -= 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cardObj1 = Card(newId: 1, newImage: "img1", newUIBtn: cardBtn1)
        let cardObj2 = Card(newId: 2, newImage: "img2", newUIBtn: cardBtn2)
        let cardObj3 = Card(newId: 3, newImage: "img3", newUIBtn: cardBtn3)
        let cardObj4 = Card(newId: 4, newImage: "img4", newUIBtn: cardBtn4)
        let cardObj5 = Card(newId: 5, newImage: "img4", newUIBtn: cardBtn5)
        let cardObj6 = Card(newId: 6, newImage: "img5", newUIBtn: cardBtn6)
        let cardObj7 = Card(newId: 7, newImage: "img6", newUIBtn: cardBtn7)
        let cardObj8 = Card(newId: 8, newImage: "img7", newUIBtn: cardBtn8)
        let cardObj9 = Card(newId: 9, newImage: "img8", newUIBtn: cardBtn9)
        
        cardList.append(contentsOf: [cardObj1, cardObj2, cardObj3, cardObj4, cardObj6, cardObj7, cardObj8, cardObj9, cardObj5])
        imgList.append(contentsOf: ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8"])
        
        for element in cardList {
            element.UIBtn.isUserInteractionEnabled = false
        }

        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            if self.correctAnswer {
                self.correctAnswer = false
                self.setClickable(value: false)
                self.startBtn.isUserInteractionEnabled = true
            } else if self.timerStart {
                self.setClickable(value: false)
                runCount += 1
                if runCount == 1 {
                    self.animation()
                } else if runCount == 2{
                    runCount = 0
                    self.setRevers()
                    self.timerStart = false
                    self.setClickable(value: true)
                }
            }
            
            if !self.startBtn.isUserInteractionEnabled {
                self.score -= 1
            }
        }
    }
    
    func animation(){
        let color = CABasicAnimation(keyPath: "borderColor")
        color.duration = 1
        color.repeatCount = 1
        self.startBtn.layer.borderWidth = 5
        
        if(self.startBtn.layer.borderColor == UIColor.green.cgColor){
            self.startBtn.layer.borderColor = UIColor.black.cgColor
        } else {
            self.startBtn.layer.borderColor = UIColor.green.cgColor
        }
        
        self.startBtn.layer.add(color, forKey: "borderColor")
    }
    
    func getImage(btn: UIButton) -> String{
        var tmp:Card
        tmp = cardList.first(where: {$0.UIBtn == btn})!
        return tmp.image
    }

    func shuffle(){
        var tmpList = imgList.map {$0.copy() as! String}
        tmpList.shuffle()
        
        for(index, element) in tmpList.enumerated(){
            cardList[index].image = element
        }
        
        cardList[8].image = (tmpList[Int.random(in: 0 ..< 8)].copy() as! String)
    }

    func setRevers(){
        for index in 0...8 {
            cardList[index].UIBtn.setImage(UIImage(named: "reverse"), for: .normal)
        }
        self.cardBtn5.setImage(UIImage(named: self.cardList[8].image), for: .normal)
    }

    func showAll(){
        for index in 0...8{
            cardList[index].UIBtn.setImage(UIImage(named: cardList[index].image), for: .normal)
        }
    }

    func letsPlay(){
        for i in 1...3 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 * Double(i)){
                self.shuffle()
                self.showAll()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
            self.setRevers()
            self.cardBtn5.setImage(UIImage(named: self.cardList[8].image), for: .normal)
        }

        setClickable(value: true)
        self.cardBtn5.isUserInteractionEnabled = false
    }
    
    func setClickable (value: Bool){
        for index in 0...8{
            self.cardList[index].UIBtn.isUserInteractionEnabled = value
        }
    }
}

