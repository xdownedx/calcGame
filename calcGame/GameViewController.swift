//
//  GameViewController.swift
//  calcGame
//
//  Created by Максим Лисицкий on 21.03.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var PrimerTF: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var forButton: UIButton!
    @IBOutlet weak var PointsTF: UILabel!
        
    var res=0
    var counter=0
    func updateInfo(){
        let a = Int.random(in: 51...200)
        let b = Int.random(in: 0...50)
        PointsTF.text="Очки: \(counter)"
        switch Int.random(in: 0...2) {
        case 0 : res = Int(a+b)
        PrimerTF.text=String("\(a)+\(b)")
        case 1 : res = Int(a-b)
        PrimerTF.text=String("\(a)-\(b)")
        case 2 : res = Int(a*b)
        PrimerTF.text=String("\(a)*\(b)")
        default: break
        }
        switch Int.random(in: 0...3) {
        case 0 :
            oneButton.setTitle("\(res)", for: .normal)
            secondButton.setTitle("\(res-Int.random(in: 1...5))", for: .normal)
            threeButton.setTitle("\(res+Int.random(in: 1...5))", for: .normal)
            forButton.setTitle("\(res+Int.random(in: 6...10))", for: .normal)
        case 1:
            oneButton.setTitle("\(res+Int.random(in: 1...5))", for: .normal)
            secondButton.setTitle("\(res)", for: .normal)
            threeButton.setTitle("\(res-Int.random(in: 1...5))", for: .normal)
            forButton.setTitle("\(res+Int.random(in: 6...10))", for: .normal)
        case 2:
            oneButton.setTitle("\(res-Int.random(in: 1...5))", for: .normal)
            secondButton.setTitle("\(res+Int.random(in: 1...5))", for: .normal)
            threeButton.setTitle("\(res)", for: .normal)
            forButton.setTitle("\(res-Int.random(in: 6...10))", for: .normal)
        case 3:
            oneButton.setTitle("\(res+Int.random(in: 1...5))", for: .normal)
            secondButton.setTitle("\(res-Int.random(in: 1...5))", for: .normal)
            threeButton.setTitle("\(res+Int.random(in: 6...9))", for: .normal)
            forButton.setTitle("\(res)", for: .normal)
        default:
            break
        }        
    }
    var second=0
    @IBOutlet weak var Time: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        oneButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
        threeButton.layer.cornerRadius = 10
        forButton.layer.cornerRadius = 10
        updateInfo()
        counter=0
        second=60
        Time.text = "Осталось \(NSString(format: "%0.2d:%0.2d",second/60,second%60))"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    var timer: Timer!
      @objc func timerFunc(timer: Timer) {
          var backgroundTask = UIApplication.shared.beginBackgroundTask()
          print(timer.timeInterval.binade)
          second-=1
          Time.text = "Осталось \(NSString(format: "%0.2d:%0.2d",second/60,second%60))"
          if backgroundTask != UIBackgroundTaskIdentifier.invalid {
              if UIApplication.shared.applicationState == .active {
                  UIApplication.shared.endBackgroundTask(backgroundTask)
                  backgroundTask = UIBackgroundTaskIdentifier.invalid
              }
          }
        if second==0
        {
            performSegue(withIdentifier: "TheEnd", sender: nil)
        }
      }
    @IBAction func TapfFB(_ sender: UIButton) {
        if oneButton.title(for: .normal)=="\(res)"{
            counter+=1
        }
        updateInfo()
    }
    @IBAction func unwindSegueToGame(segue: UIStoryboardSegue){
        
    }
    @IBAction func TapSB(_ sender: Any) {
        if secondButton.title(for: .normal)=="\(res)"{
            counter+=1
        }
        updateInfo()
    }
    
    @IBAction func TapTB(_ sender: Any) {
        if threeButton.title(for: .normal)=="\(res)"{
            counter+=1
        }
        updateInfo()
    }
    @IBAction func TapForB(_ sender: Any) {
        if forButton.title(for: .normal)=="\(res)"{
            counter+=1
        }
        updateInfo()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard let dvc = segue.destination as? EndScreenViewController else {return}
           dvc.score=counter
       }
}
