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

    var customTransition: DiscoTransition!
    
    @IBOutlet weak var discoImageView: UIImageView!
    var discoImages: [UIImage]!
    var animatedDiscoImage: UIImage!
    

  // Custom disco transition to the Dance View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVC = segue.destination
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.custom
        customTransition = DiscoTransition()
        destinationVC.transitioningDelegate = customTransition
        customTransition.duration = 5.0
    }
    
    
 // Loading the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discoImages = [#imageLiteral(resourceName: "disco1"), #imageLiteral(resourceName: "disco2"), #imageLiteral(resourceName: "disco3"), #imageLiteral(resourceName: "disco4"), #imageLiteral(resourceName: "disco5"), #imageLiteral(resourceName: "disco6"), #imageLiteral(resourceName: "disco7"), #imageLiteral(resourceName: "disco8"), #imageLiteral(resourceName: "disco9"), #imageLiteral(resourceName: "disco10"), #imageLiteral(resourceName: "disco11"), #imageLiteral(resourceName: "disco12"), #imageLiteral(resourceName: "disco13"), #imageLiteral(resourceName: "disco14"), #imageLiteral(resourceName: "disco15"), #imageLiteral(resourceName: "disco16"), #imageLiteral(resourceName: "disco17"), #imageLiteral(resourceName: "disco18"), #imageLiteral(resourceName: "disco19"), #imageLiteral(resourceName: "disco20"), #imageLiteral(resourceName: "disco21"), #imageLiteral(resourceName: "disco22"), #imageLiteral(resourceName: "disco23"), #imageLiteral(resourceName: "disco24"), #imageLiteral(resourceName: "disco25")]
        
        animatedDiscoImage = UIImage.animatedImage(with: discoImages, duration: 3.0)
        discoImageView.image = animatedDiscoImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
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
    
    // COMPONENT SIDEBAR TOUCH INDICATORS
    
    @IBAction func didTapHairButton(_ sender: UIButton) {
        componentImage1.backgroundColor = UIColor.black
        componentImage2.backgroundColor = UIColor.darkGray
        componentImage3.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func didTapEyeButton(_ sender: UIButton) {
        componentImage1.backgroundColor = UIColor.red
        componentImage2.backgroundColor = UIColor.orange
        componentImage3.backgroundColor = UIColor.yellow
    }
    
    


}
