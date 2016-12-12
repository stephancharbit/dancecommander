//
//  DancefloorViewController.swift
//  Dance Commander
//
//  Created by KLT on 12/6/16.
//  Copyright © 2016 Dance Commander. All rights reserved.
//

import UIKit

class DancefloorViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var bodyView: UIImageView!
    @IBOutlet var headView: UIImageView!
    @IBOutlet var dancer: UIView!
    @IBOutlet var legView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var loadingImage: UIImageView!
    
    //Loading Images
    let loadingImage1 = #imageLiteral(resourceName: "disco1")
    let loadingImage2 = #imageLiteral(resourceName: "disco2")
    let loadingImage3 = #imageLiteral(resourceName: "disco3")
    let loadingImage4 = #imageLiteral(resourceName: "disco4")
    let loadingImage5 = #imageLiteral(resourceName: "disco5")
    let loadingImage6 = #imageLiteral(resourceName: "disco6")
    let loadingImage7 = #imageLiteral(resourceName: "disco7")
    let loadingImage8 = #imageLiteral(resourceName: "disco8")
    let loadingImage9 = #imageLiteral(resourceName: "disco9")
    let loadingImage10 = #imageLiteral(resourceName: "disco10")
    let loadingImage11 = #imageLiteral(resourceName: "disco11")
    let loadingImage12 = #imageLiteral(resourceName: "disco12")
    let loadingImage13 = #imageLiteral(resourceName: "disco13")
    let loadingImage14 = #imageLiteral(resourceName: "disco14")
    let loadingImage15 = #imageLiteral(resourceName: "disco15")
    let loadingImage16 = #imageLiteral(resourceName: "disco16")
    let loadingImage17 = #imageLiteral(resourceName: "disco17")
    let loadingImage18 = #imageLiteral(resourceName: "disco18")
    let loadingImage19 = #imageLiteral(resourceName: "disco19")
    let loadingImage20 = #imageLiteral(resourceName: "disco20")
    let loadingImage21 = #imageLiteral(resourceName: "disco21")
    let loadingImage22 = #imageLiteral(resourceName: "disco22")
    let loadingImage23 = #imageLiteral(resourceName: "disco23")
    let loadingImage24 = #imageLiteral(resourceName: "disco24")
    let loadingImage25 = #imageLiteral(resourceName: "disco25")
    
    var loadingImages: [UIImage]!
    var animatedImage: UIImage!

    

    

    
    //Images
    var headViewImage: UIImage!
    var legViewImage: UIImage!
    var bodyViewImage: UIImage!
    
    var tempo = 0.55
    var startingY = 300
    var startingRotation = 0
    var gravity: UIGravityBehavior!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var theBodyPart:UIView!
    var dancerStartPoint:CGPoint!
    var isSpinning:Bool!
    
    @IBOutlet weak var tinyDancer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading Disco Ball
        loadingImages = [loadingImage1, loadingImage2, loadingImage3, loadingImage4, loadingImage5, loadingImage6, loadingImage7, loadingImage8, loadingImage9, loadingImage10, loadingImage11, loadingImage12, loadingImage13, loadingImage14, loadingImage15, loadingImage16, loadingImage17, loadingImage18, loadingImage19, loadingImage20, loadingImage21, loadingImage22, loadingImage23, loadingImage24, loadingImage25]
        
        animatedImage = UIImage.animatedImage(with: loadingImages, duration: 2.0)
        
        
        
        // Do any additional setup after loading the view.
        startingY = Int(bodyView.center.y)
        startingRotation = 0
        animator = UIDynamicAnimator(referenceView: view)
        //animator.addBehavior(attachment)
        theBodyPart = bodyView
        dancerStartPoint = dancer.center
        
        //image setup
        headView.image = headViewImage
        legView.image = legViewImage
        bodyView.image = bodyViewImage
        
        
        //legTapGR.delegate = self
        //legSwipeGR.delegate = self
        
        isSpinning = false
        
        //Swiping recognizers
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
    }
    
   
     override func viewWillAppear(_ animated: Bool) {
    loadingView.backgroundColor = UIColor.black
     loadingImage!.image = animatedImage
    loadingImage!.contentMode = .scaleAspectFit
    loadingImage!.center.y = 300
     }
    

    override func viewDidAppear(_ animated: Bool) {
        loadingView.isHidden = true
        loadingImage.isHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    //SHARE
    @IBAction func didTapShare(_ sender: Any) {
    displayShareSheet(shareContent: tinyDancer.image!)
    }
    
    func displayShareSheet(shareContent:UIImage) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent ], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }
    
    //////////////////////////////////////////////////////////////////////////////////
    // TEMPO SLIDER //////////////////////////////////////////////////////////////////
    
    @IBAction func didSlide(_ sender: Any) {
        tempo = 1.1-(Double(Float(slider.value)))
        print("tempo: ",tempo)
        danceStop()
        //danceStart()
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
        headStop()
        bodyStop()
        legStop()
    }
    
    func headStop(){
        headView.transform = CGAffineTransform.identity
        headView.layer.removeAllAnimations()
    }
    
    func bodyStop(){
        bodyView.transform = CGAffineTransform.identity
        bodyView.layer.removeAllAnimations()
    }
    
    func legStop(){
        legView.transform = CGAffineTransform.identity
        legView.layer.removeAllAnimations()
    }
    
    func anyStop(bodyPart: UIView){
        bodyPart.transform = CGAffineTransform.identity
        bodyPart.layer.removeAllAnimations()
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
        isSpinning = true
        UIView.animate(withDuration: (tempo), delay: 0.0, options: [.curveEaseInOut,], animations: {
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y-200)
            //print(self.slider.value)
        }, completion: {finished in
            UIView.animate(withDuration: (self.tempo/2), delay: 0.0, options: [.curveEaseInOut], animations: {
                bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y+200)
                self.isSpinning = false
                
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
            bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y-140)
            //print(self.slider.value)
        }, completion: {finished in
            UIView.animate(withDuration: (self.tempo/2), delay: 0.0, options: [.curveEaseInOut], animations: {
                bodyPart.center = CGPoint(x: bodyPart.center.x+00, y: bodyPart.center.y+140)
            })
        })
    }
    
    //////////////////////////////////////////////////////
    // GESTURE RECOGNIZERS ///////////////////////////////
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                shake(bodyPart: theBodyPart)
                print("shake")
            case UISwipeGestureRecognizerDirection.down:
                bounce(bodyPart: theBodyPart)
                print("bounce")
            case UISwipeGestureRecognizerDirection.left:
                shake(bodyPart: theBodyPart)
                print("shake")
            case UISwipeGestureRecognizerDirection.up:
                jump(bodyPart: dancer)
                print("jump")
            default:
                break
            }
        }
    }
    
    var snap: UISnapBehavior!
    
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        var tapPoint: CGPoint = sender.location(in: view)
        tapPoint.y = dancerStartPoint.y
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        snap = UISnapBehavior(item: dancer, snapTo: tapPoint)
        animator.addBehavior(snap)
    }
    
    //    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    //        var velocity = sender.velocity(in: view)
    //
    //        //print("Velocity: ", velocity)
    //        //print(sender)
    //        if (velocity.y >= 230) {
    //            bounce(bodyPart: theBodyPart)
    //            print("BOUNCE")
    //            print("velocity is", velocity)
    //        }
    //        if (velocity.x >= 230){
    //            shake(bodyPart: theBodyPart)
    //            print("SHAKE")
    //            //return()
    //        }
    //
    ////        if (velocity.y >= 1200) {
    ////            jump(bodyPart: theBodyPart)
    ////            print("JUMP")
    ////            //return()
    ////        }
    //
    //        let translation = sender.translation(in: self.view)
    //        //print("Translation: ", translation)
    //
    //    }
    
    
    //Body Part Selectors
    func wasSelected(sender:UIImageView){
        UIView.animate(withDuration: (0.2), delay: 0.0, options: [.curveEaseOut,  .autoreverse], animations: {
            sender.transform = sender.transform.scaledBy(x:1.1, y:1.1)
        }, completion: {finished in
            sender.transform = sender.transform.scaledBy(x:0.909, y:0.909)
        })
    }
    @IBAction func didTapHead(_ sender: UITapGestureRecognizer) {
        print("Head")
        headView.transform = CGAffineTransform.identity
        headView.layer.removeAllAnimations()
        wasSelected(sender: headView)
        theBodyPart = headView
    }
    
    @IBAction func didTapLegs(_ sender: Any) {
        print("Legs")
        legView.transform = CGAffineTransform.identity
        legView.layer.removeAllAnimations()
        wasSelected(sender: legView)
        theBodyPart = legView
    }
    @IBAction func didTapBody(_ sender: Any) {
        print("Body")
        bodyView.transform = CGAffineTransform.identity
        bodyView.layer.removeAllAnimations()
        wasSelected(sender: bodyView)
        theBodyPart = bodyView
    }
    @IBAction func didRotate(_ sender: UIRotationGestureRecognizer) {
        print("rotated")
        if (isSpinning == false){
            spin(bodyPart: dancer)
        }
    }
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
    }
    
    @IBAction func didPressEdit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
