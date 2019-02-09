//
//  clearImage.swift
//  App_test6
//
//  Created by 大野和也 on 2018/11/20.
//  Copyright © 2018 yazuyazuya. All rights reserved.
//

import UIKit

class clearImage: UIView {
    
    var penColor = UIColor.blue                 // 引く線の色
    var penSize: CGFloat = 6.0                  // 引く線の太さ
    private var path: UIBezierPath!             // pathはnilも格納できるオプショナルUIBezierPath型
    // UIBezierPathは線を描画するときに使う
    private var lastDrawImage: UIImage!         // lastDrawImageはnilも格納できるオプショナルUIImage型
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // UIBezierPath のインスタンス生成
        let line = UIBezierPath()
        // 起点
        line.move(to: CGPoint(x: 0, y: 0))
        // 帰着点
        line.addLine(to: CGPoint(x: 430, y: 0))
        line.addLine(to: CGPoint(x: 430, y: 813))
        line.addLine(to: CGPoint(x: 0, y: 813))
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.white.setStroke()
        UIColor.white.setFill()   //塗りつぶす色
        line.fill()                 //塗りつぶす
        // ライン幅
        line.lineWidth = 2
        // 描画
        line.stroke()
        
        lastDrawImage?.draw(at: CGPoint.zero)   // lastDrawImageに前回描画したところまでを描画
        penColor.setStroke()                    // 引く線の色をpenColorに設定
        path?.stroke()                          // pathを描画する
        
    }
    
    // タップし始めを描画する関数
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)  // タップした場所の座標の取得
        path = UIBezierPath()
        path?.lineWidth = penSize                     // 引く線の太さをpenSizeに設定
        path?.lineCapStyle = CGLineCap.round          // 線の先端の形の設定
        // roundの他にbuttとsquareがある
        path?.lineJoinStyle = CGLineJoin.round        // 線の形の設定
        path?.move(to: currentPoint)                  // 線の起点
        // moveの前にaddLineを書いても線は描かれない
    }
    
    // タップ中を描画する関数
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タップした場所の座標の取得
        let currentPoint = touches.first!.location(in: self)
        let previousPoint = touches.first!.previousLocation(in: self)
        let middlePoint = CGPoint(x: (currentPoint.x + previousPoint.x) * 0.5, y: (currentPoint.y + previousPoint.y) * 0.5)
        path.addQuadCurve(to: middlePoint, controlPoint: previousPoint)  //これで線を滑らかにする
        setNeedsDisplay()                             // UIViewに「再描画が必要」というフラグを設定
        // 再描画の処理を行うのは別の処理でやる
        // これで継続して描画をする？
    }
    
    // タップし終わりを描画する関数
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)  // タップした場所の座標の取得
        path.addLine(to: currentPoint)                // 線の帰着点
        lastDrawImage = snapShot()
        setNeedsDisplay()
    }
    
    func snapShot() -> UIImage {
        //UIGraphicsBeginImageContextWithOptions(図形の大きさ, 透過性の有無, 解像度？(基本0.0で良さそう))
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        lastDrawImage?.draw(at: CGPoint.zero)
        penColor.setStroke()                                             // 線の色をpenColorに設定
        path?.stroke()                                                   // pathを描画する
        // imageは現在の画面の状態を保存し、表示する
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func eraser () {
        penColor = UIColor.white
    }
    
    func color1 () {
        penColor = UIColor.blue
    }
    
    func color2 () {
        penColor = UIColor.red
    }
    
    func color3 () {
        penColor = UIColor.yellow
    }
    
    func color4 () {
        penColor = UIColor.black
    }

}
