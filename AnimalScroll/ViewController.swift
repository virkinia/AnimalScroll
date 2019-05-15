//
//  ViewController.swift
//  AnimalScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var scrollImage: UIScrollView!


    @IBOutlet weak var leadingCons: NSLayoutConstraint!
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    @IBOutlet weak var topCons: NSLayoutConstraint!

    @IBOutlet weak var trailingCons: NSLayoutConstraint!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


// Cuando cambiamos de orientación el móvil
    override func viewWillLayoutSubviews() {

        //llamo al padre
        super.viewWillLayoutSubviews()

        // View es la View que tenemos asociada en este caso se llama así, podría tener otro nombre
    updateMinZoomScaleForSize(view.bounds.size)

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
    }



}

