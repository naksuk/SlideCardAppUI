import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func setup() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 20
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        guard  let view = gesture.view else { return }
        
        if gesture.state == .changed {
            self.handlePanChange(translation: translation)
        } else if  gesture.state == .ended {
            self.handlePanEnded(view: view, translation: translation)
        }
        
    }
    
    private func handlePanChange(translation: CGPoint) {
        let degree: CGFloat = translation.x / 20
        let angle = degree * .pi / 100
        
        let rotateTranslation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
        
        let ratio: CGFloat = 1 / 100
        let ratioValue = ratio * translation.x
        
        if translation.x > 0 {
            //self.goodLabel.alpha = ratioValue
        } else if translation.x < 0 {
            //self.nopeLabel.alpha = -ratioValue
        }
        
    }
    
    private func handlePanEnded(view: UIView, translation: CGPoint) {
        if translation.x <= -120 {
            view.removeCardViewAnimation(x: -600)
            
        } else if translation.x >= 120 {
            view.removeCardViewAnimation(x: 600)

        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
                self.transform = .identity
                self.layoutIfNeeded()
                //self.goodLabel.alpha = 0
                //self.nopeLabel.alpha = 0
            }
        }
        
    }
    
    
    
    
}
