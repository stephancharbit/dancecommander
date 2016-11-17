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

    
    
 // Loading the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
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
