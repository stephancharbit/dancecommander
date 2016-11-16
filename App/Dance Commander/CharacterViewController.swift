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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapMale(_ sender: UIButton) {
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "man icon")
        
    }
    
    
    @IBAction func didTapFemale(_ sender: UIButton) {
        characterContainerView.contentMode = .scaleAspectFit
        characterContainerView.image = #imageLiteral(resourceName: "woman icon")
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
