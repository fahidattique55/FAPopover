//
//  FAPopoverManager.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit


class FAPopoverManager: NSObject, UIPopoverPresentationControllerDelegate {

    // MARK:- Static

    private override init() { super.init() }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    

    
    static let shared = FAPopoverManager()

    
    static var backgroundColorOverlay: UIColor = UIColor.black.withAlphaComponent(0.0)
    static var backgroundColorPopover: UIColor = .white
    static var fadeInDuration: TimeInterval = 0.2
    static var fadeOutDuration: TimeInterval = 0.15
    static var fadeInAlpha: CGFloat = 0.3


    fileprivate weak var topViewController: UIViewController!

    
    

    static func show(_ controller: UIViewController, arrow: UIPopoverArrowDirection, contentSize: CGSize, sourceRect: CGRect, sourceView: UIView) {
        
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = contentSize
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.delegate = FAPopoverManager.shared
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceRect
        presentationController.permittedArrowDirections = arrow
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        topViewController.present(controller, animated: true)
    }
    
    // MARK: - IBActions
    
//    func dismissPopover() {
//
//        guard let topViewController = self.topViewController else { return }
//        guard let presentedVC = topViewController.presentedViewController else { return }
//        guard let popoverPresentationController = presentedVC.popoverPresentationController else { return }
//        guard let delegate = popoverPresentationController.delegate else { return }
//        delegate.popoverPresentationControllerDidDismissPopover!(popoverPresentationController)
//    }
}
