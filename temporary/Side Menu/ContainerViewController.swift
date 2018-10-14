import UIKit
import QuartzCore

// ContainerViewController is the base where it takes MainViewController and SlideViewController.
class ContainerViewController: UIViewController {
  
  enum SlideOutState {
    case bothCollapsed
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: MainViewController!
  
// If SlideViewController is not opened. Then the current status will be both collapsed.
  var currentState: SlideOutState = .bothCollapsed {
    didSet {
      let shouldShowShadow = currentState != .bothCollapsed
      showShadowForCenterViewController(shouldShowShadow)
    }
  }
  
  var rightViewController: SlideOutViewController?
  let centerPanelExpandedOffset: CGFloat = 60
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // story boards of the center view controller, container vew controller and slide view controller.
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self
    centerNavigationController = UINavigationController(rootViewController: centerViewController)
    view.addSubview(centerNavigationController.view)
    addChildViewController(centerNavigationController)
    centerNavigationController.didMove(toParentViewController: self)
  }
}

// checks status whether the side panel is open or not.
extension ContainerViewController: CenterViewControllerDelegate {
  func toggleRightPanel() {
    let notAlreadyExpanded = (currentState != .rightPanelExpanded)
    
    if notAlreadyExpanded {
      addRightPanelViewController()
    }
    animateRightPanel(shouldExpand: notAlreadyExpanded)
  }
  
    // slide view controller added to the container view controller and removes the center view controller.
  func addChildSidePanelController(_ sidePanelController: SlideOutViewController) {
    view.insertSubview(sidePanelController.view, at: 0)
    addChildViewController(sidePanelController)
    sidePanelController.didMove(toParentViewController: self)
  }
  
    // Slide view controller to expand if not expanded.
  func addRightPanelViewController() {
    guard rightViewController == nil else { return }

    if let vc = UIStoryboard.rightViewController() {
      addChildSidePanelController(vc)
      rightViewController = vc
    }
  }
    
    // Center View Controller status.
  func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.8,
                   initialSpringVelocity: 0,
                   options: .curveEaseInOut, animations: {
                    self.centerNavigationController.view.frame.origin.x = targetPosition
    }, completion: completion)
  }
  
    // Slide view controller status.
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

// Storyboards of the SlideViewController and MainViewController.
private extension UIStoryboard {
  static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
  static func rightViewController() -> SlideOutViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "SlideOutViewController") as? SlideOutViewController
  }
  
  static func centerViewController() -> MainViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
  }
}
