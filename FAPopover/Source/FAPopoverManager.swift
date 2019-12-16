//
//  FAPopoverManager.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

protocol PopoverPresentable where Self: UIViewController {
    
    func preferredContentsizeForPopover() -> CGSize
}


class FAPopoverManager: NSObject, UIPopoverPresentationControllerDelegate, UINavigationControllerDelegate {

    // MARK:- Properties

    static let shared = FAPopoverManager()
    static var defaultSizeForPopover = CGSize(width: 250, height: 320)
    
    // MARK:- Life Cycle

    private override init() { super.init() }


    // MARK:- Functions

    static func show(_ controller: UIViewController, arrow: UIPopoverArrowDirection, sourceRect: CGRect, sourceView: UIView) {
        
        if let popoverPresentableController = controller as? PopoverPresentable {
            controller.preferredContentSize = popoverPresentableController.preferredContentsizeForPopover()
        }
        else if let navigationController = controller as? UINavigationController {
            if let firstController = navigationController.viewControllers.first as? PopoverPresentable {
                navigationController.preferredContentSize = firstController.preferredContentsizeForPopover()
            }
            else {
                controller.preferredContentSize = FAPopoverManager.defaultSizeForPopover
            }
        }
        else {
            controller.preferredContentSize = FAPopoverManager.defaultSizeForPopover
        }
        
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.delegate = FAPopoverManager.shared
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceRect
        presentationController.permittedArrowDirections = arrow
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        topViewController.present(controller, animated: true)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
