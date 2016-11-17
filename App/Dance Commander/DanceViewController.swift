//
//  DanceViewController.swift
//  Dance Commander
//
//  Created by kleight on 11/15/16.
//  Copyright © 2016 Dance Commander. All rights reserved.
//

import UIKit

class DanceViewController: UIViewController {
    
    @IBOutlet weak var characterContainerView: UIImageView!
 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapBack(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
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
