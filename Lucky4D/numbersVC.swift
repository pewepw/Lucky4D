//
//  numbersVC.swift
//  Lucky4D
//
//  Created by Harry Ng on 01/02/2017.
//  Copyright © 2017 Harry Ng. All rights reserved.
//

import UIKit

class numbersVC: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var groundView: UIView!
    
    var animator:UIDynamicAnimator!
    var num1:UILabel!
    var num2:UILabel!
    var num3:UILabel!
    var num4:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // num1
        num1 = UILabel(frame: CGRect(x: view.frame.midX - 60, y: -0, width: 50, height: 50))
        num1.text = String(arc4random_uniform(9))
        num1.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        num1.textColor = .white
        num1.textAlignment = .center
        num1.layer.cornerRadius = 10
        num1.clipsToBounds = true
        num1.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
        self.view.addSubview(num1)
        
        
        // num2
        num2 = UILabel(frame: CGRect(x: view.frame.midX - 40, y: -0, width: 50, height: 50))
        num2.text = String(arc4random_uniform(9))
        num2.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        num2.textColor = .white
        num2.textAlignment = .center
        num2.layer.cornerRadius = 10
        num2.clipsToBounds = true
        num2.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
        self.view.addSubview(num2)
        
        // num3
        
        num3 = UILabel(frame: CGRect(x: view.frame.midX - 20, y: -0, width: 50, height: 50))
        num3.text = String(arc4random_uniform(9))
        num3.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        num3.textColor = .white
        num3.textAlignment = .center
        num3.layer.cornerRadius = 10
        num3.clipsToBounds = true
        num3.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
        self.view.addSubview(num3)
        
        // num4
        
        num4 = UILabel(frame: CGRect(x: view.frame.midX + 20, y: -0, width: 50, height: 50))
        num4.text = String(arc4random_uniform(9))
        num4.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        num4.textColor = .white
        num4.textAlignment = .center
        num4.layer.cornerRadius = 10
        num4.clipsToBounds = true
        num4.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
        self.view.addSubview(num4)
        
        
        
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        addGravity()

        
        
        
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        if NSNumber(integerLiteral: 1).isEqual(identifier) {
            num1.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
            num2.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
            num3.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
            num4.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
        }
        
    }
    
    
        
    
    func addGravity() {
        
        let gravity = UIGravityBehavior(items: [num1 , num2 , num3 , num4])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [num1 , num2 , num3 , num4])
        collision.addBoundary(withIdentifier: 1 as NSCopying, from: groundView.frame.origin, to: CGPoint(x: groundView.frame.origin.x + groundView.frame.width, y: groundView.frame.origin.y))
        
        animator.addBehavior(collision)
        
        
        collision.collisionDelegate = self
        
        let ballBehavior = UIDynamicItemBehavior(items: [num1 , num2 , num3 , num4])
        ballBehavior.elasticity = 0.75
        
        animator.addBehavior(ballBehavior)

    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
    
}

