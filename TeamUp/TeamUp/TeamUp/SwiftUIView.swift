//
//  SwiftUIView.swift
//  TeamUp
//
//  Created by user on 10/11/23.
//
import UIKit

class DraggableView: UIView {
    var lastLocation: CGPoint = CGPoint(x: 0, y: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)

        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.blue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.superview)

        if let view = recognizer.view {
            view.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
        }

        if recognizer.state == .ended {
            // Atualiza a última localização após o término do movimento
            lastLocation = self.center
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Cria uma instância da DraggableView
        let draggableView = DraggableView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

        // Adiciona a DraggableView à view principal
        self.view.addSubview(draggableView)
    }
}
