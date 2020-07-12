//
//  AgencyFormTwoEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormTwoEnglishViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
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

        }
        
        func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
        {
             return imageView
        }
    @IBAction func onSubmit(_ sender: Any) {
      let screenshot = self.view.takeScreenshotFour()
                    UIImageWriteToSavedPhotosAlbum(screenshot, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
                    
                }
                
                
        @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {           if let error = error {
                    let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    present(ac, animated: true)}
                else {
                    }
                }
    }
            extension UIView {
                    func takeScreenshotFour() -> UIImage {
                    drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                    let image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    if image != nil {
                        return image!
                    }
                    return UIImage()
                    
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
