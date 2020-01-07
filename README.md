![Alt text](https://i.imgur.com/v12tbAh.png "FAPopover-Image")


<p align="center">
    <a href="http://i.imgur.com/ZN13eaf.gif">
        <img src="https://i.imgur.com/fpOPTbO.gif" height="450">
    </a>
</p>



[![Swift version](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat.svg)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/cocoapods/p/FAPanels.svg?style=flat)](http://cocoapods.org/pods/FAPanels)





## Benefits

- Single library to show popovers in both iPhones & iPads
- One line usage with easy integration
- Works on iPhone portrait and landscape mode as well




## Installation

### Swift Package Manager

Right now **FAPopover** is only supported via swift package manager. You can also install it manually. Just drag source folder files into your project and you're all set.





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

For more details visit the [LICENSE](https://github.com/fahidattique55/FAPopover/blob/master/LICENSE.txt) file for more info.


## Author

**Fahid Attique** - (https://github.com/fahidattique55)

