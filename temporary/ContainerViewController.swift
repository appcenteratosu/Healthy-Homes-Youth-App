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
import QuartzCore

class ContainerViewController: UIViewController {
  
  enum SlideOutState {
    case bothCollapsed
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: CenterViewController!
  
  
  var currentState: SlideOutState = .bothCollapsed {
    didSet {
      let shouldShowShadow = currentState != .bothCollapsed
      showShadowForCenterViewController(shouldShowShadow)
    }
  }
  
  var rightViewController: SlideOutViewController?
//  var leftViewController: SidePanelViewController?
  let centerPanelExpandedOffset: CGFloat = 60

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    welcomeViewController = UIStoryboard.welcomeViewController()
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self
    
    // wrap the centerViewController in a navigation controller, so we can push views to it
    // and display bar button items in the navigation bar
//    view.addSubview(welcomeViewController.view)
    centerNavigationController = UINavigationController(rootViewController: centerViewController)
    view.addSubview(centerNavigationController.view)
    addChildViewController(centerNavigationController)
    
    centerNavigationController.didMove(toParentViewController: self)
  }
}

extension ContainerViewController: CenterViewControllerDelegate {
  
  
  func toggleRightPanel() {
    let notAlreadyExpanded = (currentState != .rightPanelExpanded)
    
    if notAlreadyExpanded {
      addRightPanelViewController()
    }
    
    animateRightPanel(shouldExpand: notAlreadyExpanded)
  }
  
 
  
  func addChildSidePanelController(_ sidePanelController: SlideOutViewController) {
    
    view.insertSubview(sidePanelController.view, at: 0)
    
    addChildViewController(sidePanelController)
    sidePanelController.didMove(toParentViewController: self)
  }
  
  func addRightPanelViewController() {
    
    guard rightViewController == nil else { return }
    
    if let vc = UIStoryboard.rightViewController() {
   //   vc.animals = Animal.allDogs()
      addChildSidePanelController(vc)
      rightViewController = vc
    }
  }
  
  
  func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
    
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.8,
                   initialSpringVelocity: 0,
                   options: .curveEaseInOut, animations: {
                    self.centerNavigationController.view.frame.origin.x = targetPosition
    }, completion: completion)
  }
  
  func animateRightPanel(shouldExpand: Bool) {
    
    if shouldExpand {
      currentState = .rightPanelExpanded
      animateCenterPanelXPosition(
        targetPosition: -centerNavigationController.view.frame.width + centerPanelExpandedOffset)
      
    } else {
      animateCenterPanelXPosition(targetPosition: 0) { _ in
        self.currentState = .bothCollapsed
        
        self.rightViewController?.view.removeFromSuperview()
        self.rightViewController = nil
      }
    }
  }
  
  func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
    
    if shouldShowShadow {
      centerNavigationController.view.layer.shadowOpacity = 0.8
    } else {
      centerNavigationController.view.layer.shadowOpacity = 0.0
    }
  }
}

private extension UIStoryboard {
  
  static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
  
  
  static func rightViewController() -> SlideOutViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "SlideOutViewController") as? SlideOutViewController
  }
  
  static func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "CenterViewController") as? CenterViewController
  }
    
    
  
//  static func welcomeViewController() -> WelcomeViewController? {
//    return mainStoryboard().instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
//  }
}
