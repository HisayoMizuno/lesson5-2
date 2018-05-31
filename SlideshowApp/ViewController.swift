//  ViewController.swift
//  SlideshowApp
//
//  Created by 水野 久代 on 2018/05/30.
//  Copyright © 2018年 水野 久代. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //-------------------------------------------------------

    @IBOutlet weak var imgArea: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer:Timer!
    var timer_sec: Float = 0
    let imgAryname = ["img0" , "img1" , "img2"]
    
    var dspimgNo = 0
    
    //------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // バンドルした画像ファイルを読み込み
        super.viewDidLoad()
        let defimg = UIImage(named: imgAryname[0])
        imgArea.image = defimg
        //再生ボタンとして表示
        //playButton.layer.borderWidth = 1
        playButton.setTitle("再生", for:UIControlState.normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //-----------------------------------------
    func upimgNo() {
        dspimgNo += 1
    }
    func dnimgNo() {
        dspimgNo -= 1
    }
    //-----------------------------------------
    func viewImage() {
        if dspimgNo < 0 {
            dspimgNo = 2
        }
        if dspimgNo > 2 {
            dspimgNo = 0
        }
        print(dspimgNo)
        let name = imgAryname[dspimgNo]
        let img  = UIImage(named: name)
        imgArea.image = img
    }
    //-------------------------------------------
    @objc func updateTimer(timer: Timer){
        self.timer_sec += 1.0
        self.timerLabel.text = String(format: "%.1f", timer_sec)
        upimgNo()
        viewImage()
    }
    //----------------------------------------------
    //「戻る」タップ時
    
    @IBAction func TapbackButton(_ sender: Any) {
        dnimgNo()
        viewImage()
    }
    //----------------------------------------------
    //「進む」タップ時
    @IBAction func TapnextButton(_ sender: Any) {
        upimgNo()
        viewImage()
    }
    //----------------------------------------------
    //「再生」タップ時
    @IBAction func TapPlayButton(_ sender: Any) {
        if self.timer == nil {
            playButton.layer.borderWidth = 1
            playButton.setTitle("停止", for:UIControlState.normal)
            self.timer_sec = 0
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            backButton.isEnabled = false
            nextButton.isEnabled = false
        }
        else{
            playButton.layer.borderWidth = 1
            playButton.setTitle("再生", for:UIControlState.normal)
            
            self.timer.invalidate() // タイマーを破棄
            self.timer = nil // timerをnilにする(startTimer用）
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    
    
}













