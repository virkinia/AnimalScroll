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

        let firstRaza = razasDeGatitos[pageIndex]

        if let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerID") as? ViewController {

            firstViewController.razaName = firstRaza
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)

        }




        // Do any additional setup after loading the view.
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

 extension GatitosUIPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    

}
