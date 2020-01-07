![Alt text](https://i.imgur.com/bxwf2aA.png "FAInteractiveView-Image")


<p align="center">
    <a href="http://i.imgur.com/ZN13eaf.gif">
        <img src="https://i.imgur.com/8bTdfjx.gif" height="450">
    </a>
</p>



[![Swift version](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat.svg)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/cocoapods/p/FAPanels.svg?style=flat)](http://cocoapods.org/pods/FAPanels)





## Design Theory

We want our views feel more responsive, acknowledging to the user that they are functional. In addition, we want the action to be cancellable if the user decides against their action after they touched down. This allows users to make quicker decisions since they can perform actions in parallel with thought.


## What are fluid interfaces?

A fluid interface might also be called ***fast***, ***smooth***, ***natural***, or ***magical***. It’s a frictionless experience that just feels ***right***.

The WWDC presentation talks about fluid interfaces as “an extension of your mind” and “an extension of the natural world”. An interface is fluid when it behaves according to the way people think, not the way machines think.


## What makes them fluid?

Fluid interfaces are responsive, interruptible, and redirectable.




## Installation

### Swift Package Manager

Right now **InteractiveView** is only supported via swift package manager. You can also install it manually.





## Usage

Following are some examples of how you can use FAPopoverManager,

### Case 1 (Simple)

```
@IBAction func showSingleControllerInPopover(_ sender: UIButton) {
    
    let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
    FAPopoverManager.show(testViewController, arrow: .up, sourceRect: sender.bounds, sourceView: sender)
}
```

### Case 2 (Navigation)

```
@IBAction func showNavigationalPopover(_ sender: UIButton) {
    
    let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
    let navigationController = UINavigationController(rootViewController: testViewController)
    FAPopoverManager.show(navigationController, arrow: .up, sourceRect: sender.bounds, sourceView: sender)
}
```

### Case 3 (UIBarButtonItem + Navigation)

```
@IBAction func showSingleControllerInFromUIBarButtonItem(_ sender: UIBarButtonItem) {
    
    let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
    let navigationController = UINavigationController(rootViewController: testViewController)

    FAPopoverManager.showFromBarButtonItem(navigationController, arrow: .up, sourceView: sender)
}
```




## License

InteractiveView is licensed under MIT.

For more details visit the [LICENSE](https://github.com/fahidattique55/InteractiveView/blob/master/LICENSE.txt) file for more info.


## Author

**Fahid Attique** - (https://github.com/fahidattique55)

