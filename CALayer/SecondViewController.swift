//
//  SecondViewController.swift
//  CALayer
//
//  Created by Алексей Трофимов on 17.04.2022.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate  {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = UIColor.systemBlue.cgColor
        }
    }
    
    var overshapeLayer: CAShapeLayer! {
        didSet {
            overshapeLayer.lineWidth = 20
            overshapeLayer.lineCap = .round
            overshapeLayer.fillColor = nil
            overshapeLayer.strokeEnd = 0
            overshapeLayer.strokeColor = UIColor.white.cgColor
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            gradientLayer.colors = [UIColor.gray.cgColor, UIColor.brown.cgColor]
            gradientLayer.locations = [0.2, 0.5, 0.8]
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        configShapeLayer(shapeLayer: shapeLayer)
        configShapeLayer(shapeLayer: overshapeLayer)
    }
    
    func configShapeLayer(shapeLayer: CAShapeLayer){
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        let center = CGPoint(x: self.view.frame.width / 2, y: imageView.frame.height / 2 + 348)
        let radius = CGFloat(Float(imageView.frame.height / 2 + 10 ))
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overshapeLayer = CAShapeLayer()
        view.layer.addSublayer(overshapeLayer)
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        
        animation.delegate = self
        
        overshapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dismiss(animated: true)
    }
    
}
