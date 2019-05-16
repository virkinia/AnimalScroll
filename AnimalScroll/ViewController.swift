//
//  ViewController.swift
//  AnimalScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var razaName: String?
    var indexRaza = 0 // la utiliza para preguntar a la vista qué index tiene y que así no se dupliquen

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var scrollImage: UIScrollView!


    @IBOutlet weak var leadingCons: NSLayoutConstraint!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    @IBOutlet weak var topCons: NSLayoutConstraint!

    @IBOutlet weak var trailingCons: NSLayoutConstraint!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //Cargar la imagen desde los assets
        imagen.image = UIImage(named: razaName ?? "carlino")


    }


// Cuando cambiamos de orientación el móvil
    override func viewWillLayoutSubviews() {

        //llamo al padre
        super.viewWillLayoutSubviews()

        // View es la View que tenemos asociada en este caso se llama así, podría tener otro nombre
    updateMinZoomScaleForSize(view.bounds.size)
    updateConstraintsForSize(view.bounds.size)

    }
}

//MARK: Controlar Scroll
extension ViewController: UIScrollViewDelegate {

    func updateMinZoomScaleForSize(_ size: CGSize) {
        let withScale = size.width / imagen.bounds.width
        let heightScale = size.height/imagen.bounds.height
        let minScale = min(withScale, heightScale)

        scrollImage.minimumZoomScale = minScale
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagen
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("Scroll")

        updateConstraintsForSize(scrollImage.bounds.size)

    }

    func updateConstraintsForSize (_ size: CGSize){
        let xOffset = max (0, (size.width - imagen.frame.width)/2)
        leadingCons.constant = xOffset
        trailingCons.constant = xOffset

        let yOffset = max (0, (size.height - imagen.frame.height)/2)
        topCons.constant = yOffset
        bottomCons.constant = yOffset

        view.layoutIfNeeded()
    }



}

