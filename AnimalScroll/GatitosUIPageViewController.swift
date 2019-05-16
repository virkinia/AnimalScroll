//
//  GatitosUIPageViewController.swift
//  AnimalScroll
//
//  Created by Dev2 on 15/05/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import UIKit

class GatitosUIPageViewController: UIPageViewController {

    let razasDeGatitos = ["persa", "siames", "comun"]
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self



        if let firstViewController = createRazaViewController() {
             self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }


        // Do any additional setup after loading the view.
    }

    func createRazaViewController() -> ViewController? {
        if !(0 ..< razasDeGatitos.count).contains(pageIndex) {
            return nil
        }
        let firstRaza = razasDeGatitos[pageIndex]

        if let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerID") as? ViewController {

            firstViewController.razaName = firstRaza
            return firstViewController
        } else {
            return nil
        }

    }

}

 extension GatitosUIPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if (pageIndex == 0) {
                return nil
        }

        pageIndex -= 1
        return createRazaViewController()


    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if (pageIndex == razasDeGatitos.count - 1) {
            return nil
        }

        pageIndex += 1
        return createRazaViewController()
    }
    

}
