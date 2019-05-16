//
//  TinderViewController.swift
//  AnimalScroll
//
//  Created by Dev2 on 16/05/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {

    @IBOutlet weak var pagePictures: UIPageControl!

    @IBOutlet weak var scrollAnimals: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let peopleCount = 3
        pagePictures.currentPage = 0
        pagePictures.numberOfPages = peopleCount
    }
    

    @IBAction func pagePicturesChanges(_ sender: UIPageControl) {

        debugPrint("Page ha cambiado a \(sender.currentPage)")


        let scrollWidth = scrollAnimals.bounds.width
        var contentOffset = scrollAnimals.contentOffset
        let offSetX = CGFloat(sender.currentPage) * scrollWidth
        
        contentOffset.x = offSetX
       scrollAnimals.contentOffset.x = offSetX
        scrollAnimals.setContentOffset(contentOffset, animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TinderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("El offset es \(scrollView.contentOffset)")
        //
        //pagePictures.currentPage = Int((scrollView.contentOffset.x + 150 ) / 300 )

        let scrollWidth = scrollView.bounds.width
        let currentPage = Int( (scrollView.contentOffset.x + (scrollWidth * 0.5)) / scrollWidth)

        pagePictures.currentPage = currentPage
    }
}
