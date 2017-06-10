//
//  ViewController.swift
//  TinderSwipe
//
//  Created by James Rochabrun on 6/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func transform(for translation: CGPoint) -> CGAffineTransform {
        
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = -sin(translation.x / (cardView.frame.width * 4.0))
        return moveBy.rotated(by: rotation)
    }
    

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: cardView.superview)
            cardView.transform = transform(for: translation)
        case .ended:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                self.cardView.transform = .identity
                
            }, completion: nil)
        default:
            break
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileImageView.layer.cornerRadius = 14
    }
}







