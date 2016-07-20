//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bonJoviImage: UIImageView!
    @IBOutlet var animateButton: UIButton!
    
    var imageYAnchor : NSLayoutConstraint?
    var shouldShrink : Bool = false
    
    var originalSize : CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Bon Jovi's height: \(self.bonJoviImage.bounds.height)")
        print("Bon Jovi's width: \(self.bonJoviImage.bounds.width)")
        
        originalSize = self.bonJoviImage.bounds
        
        layoutViews()
    }
    
    func layoutViews() {
        self.bonJoviImage.translatesAutoresizingMaskIntoConstraints = false
        self.bonJoviImage.removeConstraints(self.bonJoviImage.constraints)
        
        self.animateButton.translatesAutoresizingMaskIntoConstraints = false
        self.animateButton.removeConstraints(self.animateButton.constraints)
        
        self.imageYAnchor = self.bonJoviImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.imageYAnchor?.active = true
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
        
        if shouldShrink == false {
        
            
            UIView.animateKeyframesWithDuration(0.75, delay: 0.0, options: [.CalculationModeLinear], animations: {
                
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.8, animations: {
                    self.bonJoviImage.bounds = CGRectMake(self.bonJoviImage.bounds.origin.x, self.bonJoviImage.bounds.origin.y, self.bonJoviImage.bounds.width, self.view.bounds.height*1.1)
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 0.2, animations: {
                    self.bonJoviImage.bounds = CGRectMake(self.bonJoviImage.bounds.origin.x, self.bonJoviImage.bounds.origin.y, self.bonJoviImage.bounds.width, self.view.bounds.height)
                })
                
            }) { completed in
                self.shouldShrink = true
            }
        }
        else { // should shrink
            UIView.animateKeyframesWithDuration(0.75, delay: 0.0, options: [.CalculationModeLinear], animations: {
                
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.8, animations: {
                    self.bonJoviImage.bounds = CGRectMake(self.bonJoviImage.bounds.origin.x, self.bonJoviImage.bounds.origin.y, (self.originalSize?.width)!, 0.9*(self.originalSize?.height)!)
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 0.2, animations: {
                    self.bonJoviImage.bounds = CGRectMake(self.bonJoviImage.bounds.origin.x, self.bonJoviImage.bounds.origin.y, (self.originalSize?.width)!, (self.originalSize?.height)!)
                })
                
            }) { completed in
                self.shouldShrink = false
            }
        }
    }
}

