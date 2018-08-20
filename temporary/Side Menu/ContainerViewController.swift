
import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
  
  enum SlideOutState {
    case bothCollapsed
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: MainViewController!
  
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
    
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self
    
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
  
  static func centerViewController() -> MainViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
  }
    
    
  
//  static func welcomeViewController() -> WelcomeViewController? {
//    return mainStoryboard().instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
//  }
}
