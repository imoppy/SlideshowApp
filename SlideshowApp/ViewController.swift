//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 若原 旬 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!

    var fileName: String = "1"
    let fileCount: Int = 7
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideImage.image = UIImage(named: fileName)
    }

    @IBAction func backButton(_ sender: Any) {
        if self.timer != nil {
            return
        }

        let current: Int = Int(fileName)!
        reloadImage(number: current <= 1 ? fileCount : current - 1)
    }

    @IBAction func nextButton(_ sender: Any) {
        if self.timer != nil {
            return
        }

        next()
    }

    @IBAction func playButton(_ sender: Any) {
        if self.timer == nil {
            playButton.setTitle("stop", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoPlay(_:)), userInfo: nil, repeats: true)
        } else {
            playButton.setTitle("play", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    func next() {
        let current: Int = Int(fileName)!
        reloadImage(number: current >= fileCount ? 1 : current + 1)
    }

    func reloadImage(number: Int) {
        self.fileName = String(number)
        slideImage.image = UIImage(named: fileName)
    }
    
    @objc func autoPlay(_ timer: Timer) {
        next()
    }
    
    @IBAction func unwind(_ seque: UIStoryboardSegue) {
    }
}

