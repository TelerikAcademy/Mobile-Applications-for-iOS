<!-- section start -->
<!-- attr: { class:'slide-title' } -->

# Views in iOS
## Built-in and custom views

<div class="signature>
  <p class="signature-course">Telerik Software Academy</p>
  <p class="signature-initiative">http://academy.telerik.com</p>
  <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<!-- attr: { showInPresentation:true, style:'' } -->
# Table of Contents
- Views
  - Overview
  - Nib/Xib files
  - Loading Nib files
- Creating custom views
  - Creating a custom reusable UITableViewCell
  - Creating a custom UIView
- Drawing on a view

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Views
##  Overview

<!-- attr: { showInPresentation:true, style:'' } -->
# Views Overview
- Views are part of the MVC architecture
  - They represent the UI of an iOS application
  - Built from NIB files and Obj-C/Swift classes
- NIB/XIB files are files with only UI
  - NExTSTEP Interface Builder
  - They have no code, only UI
- NIB files can be loaded dynamically
  - As a resource

<!-- attr: { showInPresentation:true, style:'' } -->
# Views Hierarchy
- Views build an hierarchy of views
  - The outer/root view is the window
  - The window contains a storyboard scene
  - Scenes can contain other views
  - Views can contain views
  - Etc….
- When the windows is rendered it sends message to its subviews to render as well
  - As do they to their subviews and so on…

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Creating and Loading NIB Files -->

##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->

# Creating Custom Views
##  UITableViewCell and UIView

<!-- attr: { showInPresentation:true, style:'' } -->

# Creating Custom Views
- Views can be created by a NIB file and a class that inherits UIView
  - Or a subclass of UIView
- The NIB file and the class are connected the same way as a storyboard scene and a ViewController
  - Select the View in Interface builder
  - Open the Utilities toolbox
  - Go to Identity inspector
  - Set the class

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Linking NIB file and a UIView subclass -->
##  [Demo]()

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Creating a Reusable UITableViewCell -->
##  [Demo]()

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Creating a Custom View -->
##  [Demo]()

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Creating View with Drawings -->
##  [Demo]()

<!-- attr: { showInPresentation:true, style:'' } -->
# Views in iOS
- http://academy.telerik.com

<!-- attr: { showInPresentation:true, style:'' } -->
# Homework
- Create a table view cell containing an image and a title
  - Use it inside a UITableViewController
- Create a custom view for representing tabs
  - Each tab has a title and content
    - The content is visible only if the tab is selected
  - Only a single tab can be selected at a time
  - The content can contain any number of UIViews
