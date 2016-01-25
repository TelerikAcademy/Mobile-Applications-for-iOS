<!-- section start -->
<!-- attr: { class:'slide-title', showInPresentation:true, style:'' } -->
# iOS Application Lifecycle
<div class="signature">
    <p class="signature-course">Telerik Software Academy</p>
    <p class="signature-initiative">http://academy.telerik.com </p>
    <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<!-- attr: { showInPresentation:true, style:'' } -->
# Table of Contents
- iOS app Execution model
  - UIApplication object
  - UIApplicationDelegate object
- UIViewController 
  - Lifecycle
  - Events
  - State

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# UIApplication
##  Execution model and lifecycle

<!-- attr: { showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# Execution model – Entry Point
- iOS Application main function:
- #import <UIKit/UIKit.h>
- #import "AppDelegate.h"
- int main(int argc, char x argv[])
- {
-     @autoreleasepool {
-         return UIApplicationMain(argc, argv, nil, 
-                  NSStringFromClass([AppDelegate class]));
-     }
- }
<div class="fragment balloon" style="width:250px; top:60%; left:10%">Called in the main entry point to create the application object, delegate and set up the event cycle</div>

<!-- attr: { showInPresentation:true, style:'' } -->
# UIApplicationDelegate
- UIApplicationDelegate – protocol declares methods that are implemented by the delegate of the singleton UIApplication object.
- AppDelegate – implements the application delegate to expose the control over the UIApplication

<!-- attr: { showInPresentation:true, style:'' } -->
# UIApplication: States
- Application states:
  - Not Running – the app is not launched
  - Inactive – the app is running in the foreground but is currently not receiving events
  - Active – the app is running in the foreground but is receiving events
  - Background – the app is running in the background and executing code
  - Suspended – the app is in the background but is not executing code

<!-- attr: { showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# UIApplication: States (2)

<img class="slide-image" src="imgs/pic.png" style="width:80%; top:10%; left:10%" />

<!-- attr: { showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# UIApplication – Launch Cycle

<img class="slide-image" src="imgs/pic.png" style="width:80%; top:10%; left:10%" />

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# UIViewController States
##  Overview and usage

<!-- attr: { showInPresentation:true, style:'' } -->
# Overview: UIViewController
- UIViewController:
  - Provides the fundamental view-management model
  - Coordinates its efforts with model objects and other controller objects communication
  - Responsible for a single view
  - States preservation and restoration

<!-- attr: { showInPresentation:true, style:'' } -->
# UIViewController – API (1)
- Managing the View
  - view – the root view of the controller’s view hierarchy
  - viewDidLoad – it is called after the view controller has loaded its view hierarchy into memory
- Handling Memory Warning
  - didReceiveMemoryWarning
    - Sent to the view controller when the app receives a memory warning

<!-- attr: { showInPresentation:true, style:'' } -->
# UIViewController – API (2)
- Responding to View Events
  - viewWillAppear
    - Notifies that its view to be added to a view hierarchy
  - viewDidAppear
    - Notifies that that its view is added to a view hierarchy
  - viewWillDisappear
    - Notifies that its view is about to be removed from a view hierarchy

<!-- attr: { showInPresentation:true, style:'' } -->
# UIViewController – API (3)
  - viewDidDisappear
    - Notifies that its view is about to be removed from a view hierarchy
  - viewWillLayoutSubviews
    - Called to notify the view controller that its view is about to layout its subviews
  - viewDidLayoutSubviews
    - Called to notify the view controller that its view has just laid out its subviews

<!-- attr: { showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# UIViewController - Lifecycle

<img class="slide-image" src="imgs/pic.png" style="width:80%; top:10%; left:10%" />

<!-- attr: { showInPresentation:true, style:'' } -->
# iOS Application Lifecycle

