//
//  SplashScreenViewController.swift
//  BookingClone
//
//  Created by Work on 20/07/25.
//

import UIKit
import Kingfisher

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         playGif()
         
         // Delay then go to main screen
         DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
             vc.modalPresentationStyle = .fullScreen
             self.present(vc, animated: true, completion: nil)
         }
     }

     func playGif() {
         if let path = Bundle.main.path(forResource: "splash_converted", ofType: "gif") {
             let url = URL(fileURLWithPath: path)
             let provider = LocalFileImageDataProvider(fileURL: url)
             gifImageView.kf.setImage(with: provider)
         }
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
