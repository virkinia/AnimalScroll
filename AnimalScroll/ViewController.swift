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





}
extension ViewController: UIScrollViewDelegate {


    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagen
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("Scroll")
    }

}

