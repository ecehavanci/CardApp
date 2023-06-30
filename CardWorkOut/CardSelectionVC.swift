//
//  CardSelectionVC.swift
//  CardWorkOut
//
//  Created by Ece Havanci on 28.06.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var timer: Timer!
    var cards:[UIImage] = Deck.allValues
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
   /* @IBOutlet var stopButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var rulesButton: UIButton!*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCorners()
        startTimer()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        //every 0.5 sec selector fires
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        print("print fired out!")
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    func addCorners(){
        for button in buttons{
            button.layer.cornerRadius = 8;
        }
        
    }
    
    @IBAction func stopButtonClick(_ sender: UIButton) {
        /*stopButton.setTitle("Stopped!", for: .normal)*/
        timer.invalidate()
    }
    @IBAction func restartButtonClick(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonClick(_ sender: UIButton) {
    }
    

}
