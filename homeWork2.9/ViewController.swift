//
//  ViewController.swift
//  homeWork2.9
//
//  Created by Александра Мельникова on 22.06.2021.
//
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var runAnimationButton: SpringButton!
    @IBOutlet weak var starImage: SpringImageView!
    
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var repeatingLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    
    private let animations = ["shake", "pop", "morph", "squeeze", "wobble",
                              "swing", "flipX", "flipY", "squeezeLeft",
                              "squeezeRight", "squeezeDown", "squeezeUp", "slideLeft",
                              "slideRight", "slideDown", "slideUp", "fadeIn", "fadeOut",
                              "fadeInLeft", "fadeInRight", "fadeInDown", "fadeInUp",
                              "zoomIn", "zoomOut", "flash"]
    
    private let curves = ["spring", "linear", "easeIn", "easeOut", "easeInOut"]
    
    private var animation = ""
    private var curve = ""
    private var repeating: Float = 0
    private var duration: CGFloat = 0
    private var rotation: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLabel.isHidden = true
        repeatingLabel.isHidden = true
        durationLabel.isHidden = true
        curveLabel.isHidden = true
        rotationLabel.isHidden = true
        
        flash(starImage)
    }
    
    func flash(_ image: SpringImageView) {
        image.animation = "flash"
        image.autostart = true
        image.repeatCount = 1000 // Не самый лучший вариант, конечно. Нужен аналог repeatForever
        image.duration = 0.6
        image.animate()
    }
    
    @IBAction func runAnimationButtonTapped(_ sender: SpringButton) {
        
        animation = animations[Int.random(in: 0..<animations.count)]
        repeating = Float.random(in: 1...3)
        duration = CGFloat.random(in: 0.1...3)
        rotation = CGFloat.random(in: -360...360)
        curve = curves[Int.random(in: 0..<curves.count)]
        
        animatedView.animation = animation
        animatedView.repeatCount = repeating
        animatedView.duration = duration
        animatedView.rotate = rotation
        animatedView.curve = curve
        
        animatedView.animate()
        
        animationLabel.text = "animation = \(animation)"
        repeatingLabel.text = "repeatCount = \(String(format: "%.2f", repeating))"
        durationLabel.text = "duration = \(String(format: "%.2f", duration))"
        curveLabel.text = "curve = \(curve)"
        rotationLabel.text = "rotation = \(String(format: "%.2f", rotation))"
        
        animationLabel.isHidden = false
        repeatingLabel.isHidden = false
        durationLabel.isHidden = false
        curveLabel.isHidden = false
        rotationLabel.isHidden = false
    }
}
