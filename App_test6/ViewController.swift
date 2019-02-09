//
//  ViewController.swift
//  App_test6
//
//  Created by 大野和也 on 2018/11/20.
//  Copyright © 2018 yazuyazuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chg = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    var draw = drawView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // width: 414, Height: 816
        let screenWidth = self.view.bounds.width      //スクリーンの横の長さ
        let screenHeight = self.view.bounds.height-80    //スクリーンの縦の長さ
        
        //drawにdrawViewと表示サイズを入れる
        draw = drawView(frame: CGRect(x: 0, y: 0,
                                          width: screenWidth, height: screenHeight))
        
        self.view.addSubview(draw)     //drawを表示する
        draw.isOpaque = false           //背景を黒色じゃなくする
        //trueならself.view.backgroundColorに関係なく黒色になる
        
        self.view.backgroundColor =
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   //背景の色を決める
        
    }
    
    @IBAction func eraserButton(_ sender: Any) {
        let screenWidth = self.view.bounds.width      //スクリーンの横の長さ
        let screenHeight = self.view.bounds.height-80    //スクリーンの縦の長さ
        //drawにdrawViewと表示サイズを入れる
        let draw = drawView(frame: CGRect(x: 0, y: 0,
                                          width: screenWidth, height: screenHeight))
        self.view.addSubview(draw)     //drawを表示する
        draw.isOpaque = false           //背景を黒色じゃなくする
        self.view.backgroundColor =
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   //背景の色を決める
        draw.eraser()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        let screenWidth = self.view.bounds.width      //スクリーンの横の長さ
        let screenHeight = self.view.bounds.height-80    //スクリーンの縦の長さ
        //drawにdrawViewと表示サイズを入れる
        let draw = clearImage(frame: CGRect(x: 0, y: 0,
                                            width: screenWidth, height: screenHeight))
        self.view.addSubview(draw)      //drawを表示する
        draw.isOpaque = false           //背景を黒色じゃなくする
        self.view.backgroundColor =
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   //背景の色を決める
        
        switch chg {
        case 0:
            draw.color1()
        case 1:
            draw.color2()
        case 2:
            draw.color3()
        case 3:
            draw.color4()
        default:
            draw.color1()
        }
        
    }
    
    @IBAction func changeButton(_ sender: Any) {
        let screenWidth = self.view.bounds.width      //スクリーンの横の長さ
        let screenHeight = self.view.bounds.height-80    //スクリーンの縦の長さ
        //drawにdrawViewと表示サイズを入れる
        let draw = drawView(frame: CGRect(x: 0, y: 0,
                                          width: screenWidth, height: screenHeight))
        self.view.addSubview(draw)     //drawを表示する
        draw.isOpaque = false           //背景を黒色じゃなくする
        self.view.backgroundColor =
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   //背景の色を決める
        
        chg += 1
        
        switch chg {
        case 0:
            draw.color1()
        case 1:
            draw.color2()
        case 2:
            draw.color3()
        case 3:
            draw.color4()
        default:
            draw.color1()
        }
        
        if chg >= 4 {
            chg = 0
        }
        
    }
    
    @IBAction func undoButton(_ sender: Any) {
        draw.undo()
    }
    
    /*
    @IBAction func redoButton(_ sender: Any) {
        draw.redo()
    }
    */
}

