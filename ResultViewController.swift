//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 水野 久代 on 2018/05/31.
//  Copyright © 2018年 水野 久代. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imgArea2: UIImageView!
    var imag:UIImage!
    
    //-----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgArea2.image = imag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func TapBackButton(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ViewController = segue.destination as! ViewController
        viewController.imag = imgArea2.image!
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
