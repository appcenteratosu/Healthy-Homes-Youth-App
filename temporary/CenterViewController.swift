/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CenterViewController: UIViewController {
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
//    let image : UIImage = UIImage(named: "top nav bar")!
//    let imageView = UIImageView(frame: CGRect(x: 16, y: 44, width: 343, height: 59))
    
    override func viewDidLoad() {
        MenuButton.setBackgroundImage(UIImage(named: "hamburger menu"), for: UIControlState.normal, barMetrics: .default)
//        imageView.contentMode = .scaleToFill
//        imageView.image = image
//        self.navigationItem.titleView = imageView
//    //    self.navigationItem.title = "Healthy Homes Youth"
//        self.navigationItem.title = "Healthy Homes Youth"
    }
  
  @IBAction func puppiesTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
    
    @IBAction func TitleMenuTapped(_ sender: Any) {
        delegate?.toggleRightPanel?()
    }
    
}
