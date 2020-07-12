//
//  AgencyFormThreePageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormThreePageTwoSpanishViewController: UIViewController {
    @IBOutlet weak var scrollViews: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewOne: SignatureView!
    @IBOutlet weak var signatureViewTwo: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViews.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   scrollViews.minimumZoomScale = 1
                   scrollViews.maximumZoomScale = 3
                   scrollViews.bounces=false
                   self.view.addSubview(scrollViews)

                   imageView.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   imageView.contentMode = .scaleToFill
                   scrollViews.addSubview(imageView)
                   scrollViews.addSubview(signatureViewOne)
                   scrollViews.addSubview(signatureViewTwo)
                   scrollViews.bringSubviewToFront(imageView)
                   scrollViews.bringSubviewToFront(signatureViewOne)
                   scrollViews.bringSubviewToFront(signatureViewTwo)

               }
               
               func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
               {
                    return imageView
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
