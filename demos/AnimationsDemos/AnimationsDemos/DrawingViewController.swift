//
//  DrawingViewController.swift
//  AnimationsDemos
//
//  Created by Doncho Minkov on 3/29/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import Foundation
import UIKit
import CoreGraphics

class Particle {
    var p1: CGPoint?
    var p2: CGPoint?
    
    init(withPoint1 p1: CGPoint, andPoint2 p2: CGPoint) {
        self.p1 = p1
        self.p2 = p2
    }
}

class LoadingView : UIView {
    var angle: CGFloat = 0.0
    
    var particlesCount: Int? = 20
    var animationTimeout = 50
    //        {
    //        willSet(count) {
    //            let offsetAngle = (2 * CGFloat.pi) / CGFloat(count)
    //            var currentAngle: CGFloat = self.angle
    //            for _ in 0..<count {
    //                let p1 = self.loaderCenter
    //                let p2 = CGPoint(
    //                    x: (self.loaderCenter?.x)! + radius! * cos(currentAngle),
    //                    y: (self.loaderCenter?.y)! + radius! * sin(currentAngle))
    //
    //                let particle = Particle(withPoint1: p1!, point2: p2, andColor: getRandomColor())
    //                self.particles?.append(particle)
    //                currentAngle = currentAngle + offsetAngle
    //            }
    //        }
    //    }
    
    var path: UIBezierPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.particlesCount = 10
        super.init(coder: aDecoder)
        self.backgroundColor = .clear
    }
    
    // with Particles
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = nil
        path = UIBezierPath()
        path?.lineWidth = 10
        path?.lineCapStyle = .round
        
        let radius = (rect.width < rect.height
            ? rect.width
            : rect.height) / 2
        
        let center = CGPoint (
            x: (rect.minX + rect.maxX) / 2,
            y: (rect.minY + rect.maxY) / 2
        )
        
        let offsetAngle = (2 * CGFloat.pi) / CGFloat(self.particlesCount!)
        var currentAngle: CGFloat = self.angle
        
        var particles: [Particle] = []
        
        for _ in 0..<self.particlesCount! {
            let p1 = CGPoint(
                x: center.x + 30 * cos(currentAngle),
                y: center.y + 30 * sin(currentAngle)
            )
            
            let p2 = CGPoint(
                x: center.x + radius * cos(currentAngle),
                y: center.y + radius * sin(currentAngle))
            
            let particle = Particle(withPoint1: p1, andPoint2: p2)
            particles.append(particle)
            currentAngle = currentAngle + offsetAngle
        }
        
        particles.forEach() {particle in
            path?.move(to: particle.p1!)
            path?.addLine(to: particle.p2!)
            
//            path?.addArc(withCenter: particle.p2!, radius: 7, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        }
        
        UIColor.black.setStroke()
        path?.stroke()
    }
    
    // with Arcs
    //    override func draw(_ rect: CGRect) {
    //        //self.frame
    //        super.draw(rect)
    //
    //
    //        path = nil
    //        path = UIBezierPath()
    //
    //        let center = CGPoint(x: rect.origin.x + rect.width / 2,
    //                             y: rect.origin.y + rect.height / 2)
    //
    //        let radius = (rect.width > rect.height
    //            ? rect.height / 2
    //            : rect.width / 2) - 5
    //
    //
    //        let startAngle1 = CGFloat(angle)
    //        let endAngle1 = angle + CGFloat.pi / 4
    //
    //        path?.move(to: center)
    //        path?.addArc(withCenter: center,
    //                     radius: radius,
    //                     startAngle: startAngle1,
    //                     endAngle: endAngle1,
    //                     clockwise: true)
    //
    //        path?.addLine(to: center)
    //
    //        let startAngle2 = angle + CGFloat.pi
    //        let endAngle2 = angle + CGFloat.pi + CGFloat.pi / 4
    //
    //        // x = cx + r * cos(a)
    //        // y = cy + r * sin(a)
    ////        let arc2Start: CGPoint = CGPoint(
    ////            x: center.x + radius * cos(startAngle2),
    ////            y: center.y + radius * sin(startAngle2))
    ////        path?.move(to: arc2Start)
    //
    //        path?.move(to: center)
    //        path?.addArc(withCenter: center,
    //                     radius: radius,
    //                     startAngle: startAngle2,
    //                     endAngle: endAngle2,
    //                     clockwise: true)
    //        path?.addLine(to: center)
    //
    //        UIColor.red.setFill()
    //        UIColor.blue.setStroke()
    //
    //        path?.lineWidth = 5
    //        path?.fill()
    //        path?.stroke()
    //    }
    
    var isAnimating = false
    
    
    func startAnimating() {
        //        self.angle = 0
        self.isAnimating = true
        
        self.animate()
    }
    
    func animate() {
        if !isAnimating {
            return
        }
        
        self.updateAngle()
        
        let timeout = DispatchTime.now() + .milliseconds(self.animationTimeout)
        DispatchQueue.main.asyncAfter(deadline: timeout) {
            self.setNeedsDisplay()
            self.animate()
        }
    }
    
    func stopAnimating() {
        self.isAnimating = false
    }
    
    func updateAngle() {
        self.angle = self.angle + 0.1
    }
    
    func getRandomColor() -> UIColor {
        let red: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        let green: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        let blue: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 255)
    }
    
}

class DrawingViewController: UIViewController {
    var loadingView: LoadingView?
    var tapGesture: UITapGestureRecognizer?
    var isAnimating = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(self.tapGesture!)
        
        self.loadingView = LoadingView(frame: self.view.frame)
        self.view.addSubview(self.loadingView!)
    }
    
    func tap() {
        if isAnimating {
            self.loadingView?.stopAnimating()
        } else {
            self.loadingView?.startAnimating()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
