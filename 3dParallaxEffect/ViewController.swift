//
//  ViewController.swift
//  3dParallaxEffect
//
//  Created by peter on 2022/7/17.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var foregroundImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    
    var manager = CMMotionManager.init()
    var label01Frame: CGRect = .zero
    
    var backgroundCenter = CGPoint.zero
    var middleCenter = CGPoint.zero
    var foregroundCenter = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.startDeviceMotionUpdates(to: .main) {motion, error in
            guard let attitude = motion?.attitude else {
                return
            }

            let eventValue = attitude.roll
            self.backgroundImageView.center.x = self.backgroundCenter.x + CGFloat(eventValue * -60)
            self.middleImageView.center.x = self.middleCenter.x + CGFloat(eventValue * -30)
            self.foregroundImageView.center.x = self.foregroundCenter.x + CGFloat(eventValue * 50)
        }
    }

    override func viewDidLayoutSubviews() {
        backgroundCenter = backgroundImageView.center
        middleCenter = middleImageView.center
        foregroundCenter = foregroundImageView.center
    }
}

