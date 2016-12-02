//
//  DanceViewController.swift
//  AnimationTester
//
//  Created by Stephan Charbit on 11/17/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class DanceViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet var slider: UISlider!
    @IBOutlet var bodyView: UIImageView!
    @IBOutlet var headView: UIImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var dancer: UIView!
    @IBOutlet var upperBodyView: UIView!
    @IBOutlet var legView: UIImageView!
    @IBOutlet var panGestureRecognizerLegs: UIPanGestureRecognizer!
    
    var tempo = 0.55
    var startingY = 300
    var startingRotation = 0
    var gravity: UIGravityBehavior!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var theBodyPart:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // shake()
        // Do any additional setup after loading the view.
        print(slider.value)
        startingY = Int(bodyView.center.y)
        print(startingY)
        startingRotation = 0
        print ("bv w/2", bodyView.frame.width/2)
        print ("bv h/2", bodyView.frame.height/2)
        //setAnchorPoint(anchorPoint: CGPoint(x: (bodyView.frame.width/2), y: (bodyView.frame.height/2)), forView: bodyView)
        //bodyView.layer.anchorPoint=CGPoint(x: 0.1, y: 0.1)
        animator = UIDynamicAnimator(referenceView: view)
        //animator.addBehavior(attachment)
        theBodyPart = bodyView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
//////////////////////////////////////////////////////////////////////////////////
// TEMPO SLIDER //////////////////////////////////////////////////////////////////
    
    @IBAction func didSlide(_ sender: Any) {
        tempo = 1.1-(Double(Float(slider.value)))
        print("tempo: ",tempo)
        danceStop()
        danceStart()
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        print("anchorpoint x", anchorPoint.x)
        print("anchorpoint y",anchorPoint.y)
        var newPoint = CGPoint(x: (view.bounds.size.width * anchorPoint.x), y: (view.bounds.size.height * anchorPoint.y))
        var oldPoint = CGPoint(x: (view.bounds.size.width * view.layer.anchorPoint.x), y:(view.bounds.size.height * view.layer.anchorPoint.y))
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        position.y -= oldPoint.y
        position.y += newPoint.y
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    func danceStart(){
        shake(bodyPart: bodyView)
    }
    
    func danceStop(){
        bodyView.transform = CGAffineTransform.identity
        bodyView.layer.removeAllAnimations()
        headView.transform = CGAffineTransform.identity
        headView.layer.removeAllAnimations()
        legView.transform = CGAffineTransform.identity
        legView.layer.removeAllAnimations()
    }
    
//////////////////////////////////////////////////////
// BUTTON ACTIONS ////////////////////////////////////
    
    @IBAction func didPressShake(_ sender: Any) {
        shake(bodyPart: theBodyPart)
    }
    
    @IBAction func didPressBounce(_ sender: Any) {
        bounce(bodyPart: theBodyPart)
    }
    
    @IBAction func didPressSpin(_ sender: Any) {
        spin(bodyPart: dancer)
    }
    
    @IBAction func didPressStop(_ sender: Any) {
        danceStop()
    }
    
    @IBAction func didPressHead(_ sender: Any) {
        theBodyPart = headView
    }
    
    @IBAction func didPressJump(_ sender: Any) {
        jump(bodyPart: dancer)
    }
    
    @IBAction func didPressBody(_ sender: Any) {
        theBodyPart = bodyView
    }
    
    @IBAction func didPressUpperBody(_ sender: Any) {
        theBodyPart = upperBodyView
    }
    
    @IBAction func didPressLegs(_ sender: Any) {
        theBodyPart = legView
    }
    
    
    
//////////////////////////////////////////////////////
// DANCE MOVES ///////////////////////////////////////
    
    func shake(bodyPart: UIView){
        bodyPart.transform = CGAffineTransform.identity
        bodyPart.transform = bodyPart.transform.rotated(by: CGFloat(-0.15))
        UIView.animate(withDuration: tempo, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            bodyPart.transform =  bodyPart.transform.rotated(by: CGFloat(0.3))
        }, completion: {finished in
        })
    }
    
    func bounce(bodyPart: UIView){
        bodyPart.transform = CGAffineTransform.identity
        //bodyPart.transform = bodyPart.transform.rotated(by: CGFloat(-0.15))
        UIView.animate(withDuration: (tempo/2), delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y+10)
            //print(self.slider.value)
        }, completion: {finished in
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y-10)
        })
    }
    
    func spin(bodyPart: UIView){
          UIView.animate(withDuration: (tempo), delay: 0.0, options: [.curveEaseInOut,], animations: {
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y-200)
            //print(self.slider.value)
        }, completion: {finished in
            UIView.animate(withDuration: (self.tempo/2), delay: 0.0, options: [.curveEaseInOut], animations: {
                bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y+200)
            })
        })
        //bodyPart.transform = CGAffineTransform.identity
        UIView.animate(withDuration: (tempo), delay: 0.0, options: [.curveEaseIn,], animations: {
            
            //      UIView.animate(withDuration: tempo, delay: 0.0, options: [.curveEaseInOut, .autoreverse], animations: {
            bodyPart.transform =  bodyPart.transform.rotated(by: CGFloat(180 * M_PI / 180))
        }, completion: {finished in
//            UIView.animate(withDuration: (self.tempo/2), delay: 0.0, options: [.curveEaseOut,], animations: {
//                //      UIView.animate(withDuration: tempo, delay: 0.0, options: [.curveEaseInOut, .autoreverse], animations: {
//                bodyPart.transform =  bodyPart.transform.rotated(by: CGFloat(180 * M_PI / 180))
//            }, completion: {finished in
//            })
        })
    }
    
    func jump(bodyPart: UIView){
        UIView.animate(withDuration: (tempo/2), delay: 0.0, options: [.curveEaseInOut,], animations: {
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y-70)
            //print(self.slider.value)
        }, completion: {finished in
            UIView.animate(withDuration: (self.tempo/2), delay: 0.0, options: [.curveEaseInOut], animations: {
                bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y+70)
            })
        })
    }
    
    var snap: UISnapBehavior!

//////////////////////////////////////////////////////
// GESTURE RECOGNIZERS ///////////////////////////////
    
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        var tapPoint: CGPoint = sender.location(in: view)
        tapPoint.y = dancer.center.y
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        snap = UISnapBehavior(item: dancer, snapTo: tapPoint)
        animator.addBehavior(snap)
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        var velocity = sender.velocity(in: view)
        //print("Velocity: ", velocity)
        //print(sender)
        if (velocity.x >= 230){
            shake(bodyPart: legView)
            print("SHAKE")
            //return()
        }
        if (velocity.y >= 230) {
            bounce(bodyPart: legView)
            print("BOUNCE")
            //return()
        }
        if (velocity.y >= 1200) {
            jump(bodyPart: legView)
            print("JUMP")
            //return()
        }
        
        let translation = sender.translation(in: self.view)
        //print("Translation: ", translation)
        
    }
   
    
}
