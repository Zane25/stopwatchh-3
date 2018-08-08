//
//  ViewController.swift
//  stopwatchh
//
//  Created by Eka Pratista Wijaya on 05/07/18.
//  Copyright © 2018 Eka Pratista Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //buat instance dari Timer Class
    var stopWatchTimer = Timer()
    var currentTime = 0
    
    
    //outlet
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    //action
    @IBAction func hasStartButtonPressed(_ sender: Any) {
        //ketika tombol start di tekan maka kita butuh untuk menghilangkan tombol start dan menampilkan tombol pause dan mengaktifkan tombol stop
        startButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isEnabled = true
        
        //membuat timer menggunakan metode instance dari timer class
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTIme)), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func hasPauseButtonPressed(_ sender: Any) {
      //ketika tombol pause ditekan kita butuh menyembunyikan tombol pause dan menampilkan start button
        startButton.isHidden = false
        pauseButton.isHidden = true
        stopButton.isEnabled = true
        
        //ketika tombol pause ditekan maka harus menghentikan timer diatasnya
        
        stopWatchTimer.invalidate() // mempause timer
        
        
    }
    
    
    @IBAction func hasStopButtonPressed(_ sender: Any) {
        pauseButton.isHidden = true
        startButton.isHidden = false
        stopButton.isEnabled = false
        
        currentTime = 0
        minutesLabel.text = "0"
        secondsLabel.text = "0"
        
        
        //stop timer
        stopWatchTimer.invalidate()
        
    }
    
    @objc func updateTIme(){
        currentTime += 1
        minutesLabel.text = "\(currentTime / 60)"
        secondsLabel.text = "\(currentTime % 60)"
        
        if currentTime == 3600{
            //3600 adalah detik yang sama dengan 1 jam
            // ketika menyentuh 3600 maka kita harus mereset waktu menjadi 0
            currentTime = 0
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ketika load maka sembunyikan tombol pause dan disable stop button
    pauseButton.isHidden = true
    stopButton.isEnabled = false
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

