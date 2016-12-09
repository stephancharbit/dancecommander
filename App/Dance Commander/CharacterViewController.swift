//
//  CharacterViewController.swift
//  Dance Commander
//
//  Created by kleight on 11/15/16.
//  Copyright © 2016 Dance Commander. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterContainerView: UIImageView!
    
    
    
    @IBOutlet weak var componentImage1: UIImageView!
    @IBOutlet weak var componentImage2: UIImageView!
    @IBOutlet weak var componentImage3: UIImageView!
    @IBOutlet weak var componentImage4: UIImageView!
    @IBOutlet weak var componentImage5: UIImageView!
    @IBOutlet weak var componentImage6: UIImageView!
    
    @IBOutlet weak var characterHead: UIImageView!
    @IBOutlet weak var characterBody: UIImageView!
    @IBOutlet weak var characterLegs: UIImageView!
   
    var componentHead: Bool!
    var componentBody: Bool!
    var componentLegs: Bool!
    

    var customTransition: DiscoTransition!
    
    @IBOutlet weak var discoImageView: UIImageView!
    var discoImages: [UIImage]!
    var animatedDiscoImage: UIImage!
    

  // Custom disco transition to the Dance View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVC = segue.destination as! DancefloorViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.custom
        customTransition = DiscoTransition()
        destinationVC.transitioningDelegate = customTransition
        customTransition.duration = 3.0
        
        destinationVC.headViewImage = self.characterHead.image
        destinationVC.bodyViewImage = self.characterBody.image
        destinationVC.legViewImage = self.characterLegs.image
        
    }
    
    
 // Loading the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterHead.image = #imageLiteral(resourceName: "head_0")
        characterBody.image = #imageLiteral(resourceName: "body_0")
        characterLegs.image = #imageLiteral(resourceName: "legs_0")
        
        discoImages = [#imageLiteral(resourceName: "disco1"), #imageLiteral(resourceName: "disco2"), #imageLiteral(resourceName: "disco3"), #imageLiteral(resourceName: "disco4"), #imageLiteral(resourceName: "disco5"), #imageLiteral(resourceName: "disco6"), #imageLiteral(resourceName: "disco7"), #imageLiteral(resourceName: "disco8"), #imageLiteral(resourceName: "disco9"), #imageLiteral(resourceName: "disco10"), #imageLiteral(resourceName: "disco11"), #imageLiteral(resourceName: "disco12"), #imageLiteral(resourceName: "disco13"), #imageLiteral(resourceName: "disco14"), #imageLiteral(resourceName: "disco15"), #imageLiteral(resourceName: "disco16"), #imageLiteral(resourceName: "disco17"), #imageLiteral(resourceName: "disco18"), #imageLiteral(resourceName: "disco19"), #imageLiteral(resourceName: "disco20"), #imageLiteral(resourceName: "disco21"), #imageLiteral(resourceName: "disco22"), #imageLiteral(resourceName: "disco23"), #imageLiteral(resourceName: "disco24"), #imageLiteral(resourceName: "disco25")]
        
        animatedDiscoImage = UIImage.animatedImage(with: discoImages, duration: 3.0)
        discoImageView.image = animatedDiscoImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // COMPONENT SIDEBAR TOUCH INDICATORS

    @IBAction func didTapHeadIndicator(_ sender: UIButton) {
        componentHead = true
        componentBody = false
        componentLegs = false
        
        componentImage1.image = #imageLiteral(resourceName: "head_1")
        componentImage1.contentMode = .scaleAspectFit
        componentImage2.image = #imageLiteral(resourceName: "head_2")
        componentImage2.contentMode = .scaleAspectFit
        componentImage3.image = #imageLiteral(resourceName: "head_3")
        componentImage3.contentMode = .scaleAspectFit
        componentImage4.image = #imageLiteral(resourceName: "head_4")
        componentImage4.contentMode = .scaleAspectFit
        componentImage5.image = #imageLiteral(resourceName: "head_5")
        componentImage5.contentMode = .scaleAspectFit
        componentImage6.image = #imageLiteral(resourceName: "head_6")
        componentImage6.contentMode = .scaleAspectFit
    }
    
    
    @IBAction func didTapBodyIndicator(_ sender: UIButton) {
        componentHead = false
        componentBody = true
        componentLegs = false
        
        componentImage1.image = #imageLiteral(resourceName: "body_1")
        componentImage1.contentMode = .scaleAspectFit
        componentImage2.image = #imageLiteral(resourceName: "body_2")
        componentImage2.contentMode = .scaleAspectFit
        componentImage3.image = #imageLiteral(resourceName: "body_3")
        componentImage3.contentMode = .scaleAspectFit
        componentImage4.image = #imageLiteral(resourceName: "body_4")
        componentImage4.contentMode = .scaleAspectFit
        componentImage5.image = #imageLiteral(resourceName: "body_5")
        componentImage5.contentMode = .scaleAspectFit
        componentImage6.image = #imageLiteral(resourceName: "body_6")
        componentImage6.contentMode = .scaleAspectFit
    }
    
    
    @IBAction func didTapLegsIndicator(_ sender: UIButton) {
        componentHead = false
        componentBody = false
        componentLegs = true
        
        componentImage1.image = #imageLiteral(resourceName: "legs_1")
        componentImage1.contentMode = .scaleAspectFit
        componentImage2.image = #imageLiteral(resourceName: "legs_2")
        componentImage2.contentMode = .scaleAspectFit
        componentImage3.image = #imageLiteral(resourceName: "legs_3")
        componentImage3.contentMode = .scaleAspectFit
        componentImage4.image = #imageLiteral(resourceName: "legs_4")
        componentImage4.contentMode = .scaleAspectFit
        componentImage5.image = #imageLiteral(resourceName: "legs_5")
        componentImage5.contentMode = .scaleAspectFit
        componentImage6.image = #imageLiteral(resourceName: "legs_6")
        componentImage6.contentMode = .scaleAspectFit
    }
    
    
    // USER CAN BUILD CHARACTER
    
    @IBAction func didTapComponent(_ sender: UITapGestureRecognizer)
    
    
    {
        let imageView = sender.view as! UIImageView
        if componentHead == true {
            characterHead.image = imageView.image
            
        }
        else if componentBody == true {
            characterBody.image = imageView.image
        }
        else if componentLegs == true {
            characterLegs.image = imageView.image
        }
        
    }
    
    
    
    
    
    
  /* NOT USED :: USER CAN SELECT GENDER ICON TO CHANGE BODY
     
    // SELECT MALE OR FEMALE BODY
    @IBAction func didTapMale(_ sender: UIButton) {
        sender.isSelected = true
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "man icon")
        
    }
    
    @IBAction func didTapFemale(_ sender: UIButton) {
        sender.isSelected = true
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "woman icon")
    }
 */
    
   
    
  
    
    


}
