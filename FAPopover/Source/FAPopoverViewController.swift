//
//  FAPopoverViewController.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

class FAPopoverViewController: UIViewController {

    // MARK:- Static

    static let shared = FAPopoverViewController()
    var backgroundColorOverlay: UIColor = UIColor.black.withAlphaComponent(0.0)
    var backgroundColorPopover: UIColor = .white
    var fadeInDuration: TimeInterval = 0.2
    var fadeOutDuration: TimeInterval = 0.15
    var fadeInAlpha: CGFloat = 0.3

    // MARK: - Class Properties
    
//    fileprivate var blackOverlayView: UIView!
    fileprivate weak var topViewController: UIViewController!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions

    func showWithAgain(_ controller: UIViewController, arrow: UIPopoverArrowDirection, contentSize: CGSize, sourceRect: CGRect, sourceView: UIView) {
        
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceRect
        presentationController.permittedArrowDirections = [.down, .up]
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        topViewController.present(controller, animated: true)
    }
    
    func showWith(_ controller: UIViewController, arrow: UIPopoverArrowDirection, contentSize: CGSize, sourceRect: CGRect, sourceView: UIView) {
        
        
//        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        
        
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = contentSize
        controller.popoverPresentationController?.permittedArrowDirections = arrow


        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }

        self.topViewController = topViewController
//        blackOverlayView = UIView(frame: topViewController.view?.frame  ?? CGRect.zero)
//        blackOverlayView.backgroundColor = backgroundColorOverlay
//        blackOverlayView.alpha = 0.0
//        topViewController.view?.addSubview(blackOverlayView)
//        blackOverlayView.fadeIn(duration: fadeInDuration, alpha: fadeInAlpha)

        topViewController.present(controller, animated: false, completion: nil)
        
        controller.popoverPresentationController?.delegate = self
        controller.popoverPresentationController?.sourceView = sourceView
        controller.popoverPresentationController?.sourceRect = sourceRect
        controller.popoverPresentationController?.backgroundColor = backgroundColorPopover
    }

    func showWithNewStyle(_ controller: UIViewController, arrow: UIPopoverArrowDirection, contentSize: CGSize, sourceView: UIBarButtonItem) {
        
        
        //        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        
        
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = contentSize
        controller.popoverPresentationController?.permittedArrowDirections = arrow
        
        
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        
        self.topViewController = topViewController
        //        blackOverlayView = UIView(frame: topViewController.view?.frame  ?? CGRect.zero)
        //        blackOverlayView.backgroundColor = backgroundColorOverlay
        //        blackOverlayView.alpha = 0.0
        //        topViewController.view?.addSubview(blackOverlayView)
        //        blackOverlayView.fadeIn(duration: fadeInDuration, alpha: fadeInAlpha)
        
        topViewController.present(controller, animated: false, completion: nil)
        
        controller.popoverPresentationController?.delegate = self
        controller.popoverPresentationController?.barButtonItem = sourceView
        controller.popoverPresentationController?.backgroundColor = backgroundColorPopover
    }

    
    
    
    
    
    
    // MARK: - IBActions
    
    func dismissPopover() {

        guard let topViewController = self.topViewController else { return }
        guard let presentedVC = topViewController.presentedViewController else { return }
        guard let popoverPresentationController = presentedVC.popoverPresentationController else { return }
        guard let delegate = popoverPresentationController.delegate else { return }
        delegate.popoverPresentationControllerDidDismissPopover!(popoverPresentationController)
    }
}




class AlwaysPresentAsPopover : NSObject, UIPopoverPresentationControllerDelegate {
    
    // `sharedInstance` because the delegate property is weak - the delegate instance needs to be retained.
    private static let sharedInstance = AlwaysPresentAsPopover()
    
    private override init() {
        super.init()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    static func configurePresentation(forController controller : UIViewController) -> UIPopoverPresentationController {
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as! UIPopoverPresentationController
//        presentationController.delegate = AlwaysPresentAsPopover.sharedInstance
        presentationController.delegate = FAPopoverViewController.shared
        return presentationController
    }
    
}














extension FAPopoverViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
//    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//
////        blackOverlayView?.fadeOut(duration: fadeOutDuration)
////        blackOverlayView?.removeFromSuperview()
//        topViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
//    }
}
