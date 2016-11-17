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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // User can select male or female body
    @IBAction func didTapMale(_ sender: UIButton) {
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "man icon")
        
    }
    
    
    @IBAction func didTapFemale(_ sender: UIButton) {
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "woman icon")
    }
    
    // User can tap to see component options
    
    @IBAction func didTapHairButton(_ sender: UIButton) {
        componentImage1.backgroundColor = UIColor.black
        
        componentImage2.backgroundColor = UIColor.darkGray
        
        componentImage3.backgroundColor = UIColor.lightGray
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
