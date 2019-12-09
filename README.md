# SOPullUpView

[![Version](https://img.shields.io/cocoapods/v/SOPullUpView.svg?style=flat)](https://cocoapods.org/pods/SOPullUpView)
[![License](https://img.shields.io/cocoapods/l/SOPullUpView.svg?style=flat)](https://cocoapods.org/pods/SOPullUpView)
[![Platform](https://img.shields.io/cocoapods/p/SOPullUpView.svg?style=flat)](https://cocoapods.org/pods/SOPullUpView)


![](https://raw.githubusercontent.com/Ahmadalsofi/SOPullUpView/master/mapExample.gif)
![](https://raw.githubusercontent.com/Ahmadalsofi/SOPullUpView/master/pickedExample.gif)

## Installation

SOPullUpView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SOPullUpView'
```


## Basic usage

1. Add `pod 'SOPullUpView'` to your Podfile.

2. The main component of the library is the SOPullUpControl. It defines an area where a view controller, called the SOPullUpView , can be dragged up and down, hiding or revealing the content.
  As an example, defines SOPullUpView and assign the datasource and init the view to be the ParentViewContrroler of the pullupView
        
     ```swift
  
       let pullUpController = SOPullUpControl()
       
       override func viewDidLoad() {
          super.viewDidLoad()
           pullUpController.dataSource = self
           pullUpController.setupCard(from: view)
        }
      ```
3. Make sure the main view controller that will adopt SOPullUpViewDataSource 
   * pullUpViewStartViewHeight ...startViewHeightForBottomViewController... 
   
      As an example, the StartViewHeight is determined by the following delegate callback:
   
      ```swift
         func pullUpViewStartViewHeight() -> CGFloat {
             return  100.0
           }
       ```
   * pullUpViewController ...UIViewController as child of your main controller...
      ```swift
        func pullUpViewController() -> UIViewController {
           guard let vc = UIStoryboard(name: StoryBoardName, bundle: nil).instantiateInitialViewController() as? YourPullUpView else {return UIViewController()}
           vc.pullUpControl = self.pullUpController
           return vc
        }
       ```
   
   * pullUpViewEndViewHeight  ...maximumHeightForBottomViewController... (Optional method)
   
   
4. In the PullUpViewController defines an instanse from SOPullUpControl to be initlized from the ParentViewContrroler
   ```swift
    var pullUpControl: SOPullUpControl? {
        didSet {
            pullUpControl?.delegate = self
        }
    }
   ```
5. finally just adopt the SOPullUpViewDelegate in the PullUpView 

    * pullUpViewStatus ...will trigger the status of the pull Up View when it's collapsed and expanded...
      ```swift
         func pullUpViewStatus(didChangeTo status: PullUpStatus) {
             switch status {
               case .collapsed:
               case .expanded:
            }
           }
        }
       ```    
    * pullUpHandleArea .......
      ```swift
        func pullUpHandleArea() -> UIView {
            return handleArea
        }
       ```     

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Ahmadalsofi,  alsofiahmad@yahoo.com

## License

SOPullUpView is available under the MIT license. See the LICENSE file for more info.
