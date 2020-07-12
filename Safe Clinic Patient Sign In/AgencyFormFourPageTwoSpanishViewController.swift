//
//  AgencyFormFourPageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormFourPageTwoSpanishViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signatureView: SignatureView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
                  scrollView.minimumZoomScale = 1
                  scrollView.maximumZoomScale = 3
                  scrollView.bounces=false
                  self.view.addSubview(scrollView)

                  imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
                  imageView.contentMode = .scaleToFill
                  scrollView.addSubview(imageView)
                  scrollView.addSubview(signatureView)
                  scrollView.bringSubviewToFront(imageView)
                  scrollView.bringSubviewToFront(signatureView)

              }
              
              func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
              {
                   return imageView
              }

}
