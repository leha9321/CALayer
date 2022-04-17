//
//  ViewController.swift
//  CALayer
//
//  Created by Алексей Трофимов on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            let borderColor = UIColor.white
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

