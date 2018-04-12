//
//  ViewController.swift
//  Simple StopWatch
//
//  Created by D7702_09 on 2018. 4. 12..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 1
    var myTimer = Timer()
    @IBOutlet weak var mylbl: UILabel!
    @IBOutlet weak var btS: UIButton!
    @IBOutlet weak var btsT: UIButton!
    @IBOutlet weak var btRe: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        mylbl.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    @IBAction func btS(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: ({(myTimer) in
            self.updateTime()
        }))
        changeButtonState(start: false, stop: true, reset: true)
    }
    
    @IBAction func btsT(_ sender: Any) {
        myTimer.invalidate()
        changeButtonState(start: true, stop: false, reset: true)
    }
    
    @IBAction func btRe(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        mylbl.text = String(format: "00:00:00")
        changeButtonState(start: true, stop: true, reset: false)
    }
    
    func changeButtonState(start: Bool, stop: Bool, reset: Bool){
        btS.isEnabled = start
        btsT.isEnabled = stop
        btRe.isEnabled = reset
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

