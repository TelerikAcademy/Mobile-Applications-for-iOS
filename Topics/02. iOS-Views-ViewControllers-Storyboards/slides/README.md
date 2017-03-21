<!-- section start -->
<!-- attr: { class:'slide-title', showInPresentation:true, style:'' } -->
# iOS App Architecture
<div class="signature">
    <p class="signature-course">Telerik Software Academy</p>
    <p class="signature-initiative">http://academy.telerik.com </p>
    <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<!-- attr: { showInPresentation:true, style:'' } -->
# Table of Contents
- iOS app architecture
- ViewControllers
- Views
- Linking Views to ViewControllers
- Adding and Using Controls

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# iOS App Architecture
##  Templates and Stuff

<!-- attr: { showInPresentation:true, style:'' } -->
# iOS App Architecture
- iOS apps are build from two components:
  - Views – represent the UI
  - ViewControllers – the programming logic
- Views are linked to ViewControllers
- ViewControllers are regular classes
  - They can fetch data from the views
  - They can send data to the views
  - They can change the views programatically

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Views
##  Views and Controls

<!-- attr: { showInPresentation:true, style:'' } -->
# Views
- Views are represented by a XIB (NIB) files
  - They hold the UI components
  - Can contain UI logic
  - Is built from controls
- When creating an iOS app, a initial view is created
  - Depending on the project type it can be empty or with a scaffold application

<!-- attr: { showInPresentation:true, style:'' } -->
# Adding Controls to a View
- To add controls to a View:
  - Open a storyboard file (Main.storyboard)
  - Show the Utilities
  - Drag a control from the toolbox into the view

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Views -->
##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# ViewControllers
##  UIViewController and UITableViewController

<!-- attr: { showInPresentation:true, style:'' } -->
# ViewControllers
- ViewControllers are the code-behind of a View
  - They are linked to a View
  - Can react to events from a View (button click, text change, etc…)
  - Can send data to a View
    - Change the content of a text field, take the selected date from a DatePicker, etc…
  - Can change a View
    - Create animations or replace views

<!-- attr: { showInPresentation:true, style:'' } -->
# Types of ViewControllers
- There are many types of ViewControllers
  - UIViewCotroller, UITableViewController, UISplitViewController, etc..
  - UIViewController and UITableViewController are used the most
- UIViewController is a generic ViewController
  - Nothing special about it
- UiTableViewController is used for a table view
  - Used to list data 

<!-- attr: { showInPresentation:true, style:'' } -->
# Creating a UIViewController
- To create a UIViewController:
  - Create a regular class and inherit UIViewController
  - Select a view from a storyboard
  - In the Utilities
    - Show Identity Inspector
    - Type the name of your UIViewController into the class text field
  - Done, can link controls

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # UIViewController -->
##  [Demo]()

<!-- attr: { showInPresentation:true, style:'' } -->
# UITableViewController
- UITableViewController is done pretty much the same as UIViewController
  - Inherit UITableViewController, instead of UIViewController
- UITableViewController needs a little setup
  - Create a Table View to the storyboard
  - Add a table view cell to the table view
    - Give it an identifier
  - Write two methods in your TableViewController
- -tableView:cellForRowAtIndexPath
- -tableView:numberOfRowsInSection

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # UITableViewController -->
##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Linking Controls from the View to the ViewController

<!-- attr: { showInPresentation:true, style:'' } -->
# Linking Controls from the View to the ViewController
- To link (use) controls in the ViewController, IBOutlets must be created
  - Go to the Storyboard
  - CTRL + click on the control
  - Select "New Referencing Outlet" and drag it to the ViewController
    - A property is created so the control can be used in the ViewController

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Using IBOutlet -->
##  [Demo]()

<!-- attr: { showInPresentation:true, style:'' } -->
# Reacting to Events
- With a IBOutlet, a control can be used in the ViewController
  - Yet actions are hard to be handled
- We can link an event from a control from the View to a method in the ViewController
  - CTRL + click on the control
  - Select a event (i.e. "Touch up inside") and drag it to the linked ViewController

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Using IBAction -->
##  [Demo]()

<!-- attr: { showInPresentation:true, style:'' } -->
# iOS app Architecture
- http://academy.telerik.com

<!-- attr: { showInPresentation:true, style:'' } -->
# Homework
- Create a UITableViewController that holds a list of generated and encoded passwords
  - Each password has an account name and encryption code
  - Once you type the code, the encrypted password is decrypted
  - Implement a UIViewController for adding a password, encryption code and an option to create a random password

