//
//  FAPopoverManager.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

public protocol PopoverPresentable where Self: UIViewController {
    
    func preferredContentsizeForPopover() -> CGSize
}


public class FAPopoverManager: NSObject, UIPopoverPresentationControllerDelegate, UINavigationControllerDelegate {

    // MARK:- Properties

    static let shared = FAPopoverManager()
    public static var defaultSizeForPopover = CGSize(width: 250, height: 320)

    // MARK:- Life Cycle

    private override init() { super.init() }


    // MARK:- Functions

    public static func show(_ controller: UIViewController, arrow: UIPopoverArrowDirection, sourceRect: CGRect, sourceView: UIView) {
        
        configureContentSize(for: controller)
        configurePopover(for: controller, arrow: arrow, sourceRect: sourceRect, sourceView: sourceView)
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        topViewController.present(controller, animated: true)
    }

    public static func showFromBarButtonItem(_ controller: UIViewController, arrow: UIPopoverArrowDirection, sourceView: UIBarButtonItem) {

        configureContentSize(for: controller)
        configurePopover(for: controller, arrow: arrow, sourceView: sourceView)
        guard let topViewController = UIViewController.topViewController() else { fatalError("Top Controller can't be nil.") }
        topViewController.present(controller, animated: true)
    }

    private static func configureContentSize(for controller: UIViewController) {
        
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
    }

    private static func configurePopover(for controller: UIViewController, arrow: UIPopoverArrowDirection, sourceRect: CGRect, sourceView: UIView) {
        
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.delegate = FAPopoverManager.shared
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceRect
        presentationController.permittedArrowDirections = arrow
    }

    private static func configurePopover(for controller: UIViewController, arrow: UIPopoverArrowDirection, sourceView: UIBarButtonItem) {
        
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.delegate = FAPopoverManager.shared
        presentationController.barButtonItem = sourceView
        presentationController.permittedArrowDirections = arrow
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
