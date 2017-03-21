<!-- section start -->
<!-- attr: { class:'slide-title', hasScriptWrapper:true, showInPresentation:true } -->
# Using Storyboards in iOS 9
##  Creating iOS application with storyboards
<div class="signature">
  <p class="signature-course">Mobile Applications for iPhone and iPad</p>
  <p class="signature-initiative">Telerik Software Academy</p>
  <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

# Table of Contents

- Storyboards overview
	- History and purpose
	- Advantages
- IBOutlets & IBActions
- Segues
	- Creating segues
	- Types
	- Unwinding segues
	- Transferring data between scenes
- Auto layout

<!-- attr: {class: 'slide-section' } -->
#  Storyboards overview
##  The interactive way for creating a multi-screen iOS application

#  Storyboards

- Storyboards are the "new" way to create an iOS application with multiple scenes
	- They provide interactive and intuitive development process
-  Storyboards consist of one or many scenes	- Each scene is a visual representation of a viewController
- Storyboards can define the way to go from scene to another scene	- Using segues
#  Storyboards

-  With a storyboard you have a better conceptual overview of all the scenes in your app
-  Cut down the amount of code in the application
-  Storyboards make it easier to use Auto Layout

#  IBOutlets

- An outlet is a property that is annotated with the symbol `IBOutlet` and whose value you can set graphically in a storyboard
- When declaring an outlet in the interface of a class:
  - A connection between the outlet and another object in the storyboard is made
  - When the file is loaded, the connection is established

```objectivec
@property (nonatomic, weak) IBOutlet UITextField *nameField`;
```

<!-- attr: {style: 'font-size: 40px'} -->
#  IBActions & Target-action pattern

- `IBAction` is a type qualifier used by **Interface Builder** to expose a method as a connection point between user interface elements and app code

- **Target-action** is a design pattern in which an object holds the information necessary to send a message to another object when an event occurs
  - The stored information consists of two items of data:
    - **An action selector**: the object which identifies the method to be invoked
    - **target**: the object to receive the message
  - The message sent when the event occurs is called an action message

#  Segues

- A segue is a link between two scenes
- Created by connecting two view controllers right in the storyboard

<!-- attr: {class: 'slide-section' } -->
#  Creating segues
## [Demo](http://)

#  Segue types
- Show
- Show detail
- Present as Popover
- Present Modally
- Custom

<!-- attr: {class: 'slide-section' } -->
#  Types of segue
## [Demo](http://)


#  Transfering data between scenes
- Set an identifier of the segue
- Override the prepareForSegue:sender: method in the first viewController
	- Check the segue identifier
	- Get the destination viewController and set its properties

<!-- attr: {class: 'slide-section' } -->
# Transfering data between scenes
##  [Demo](http://)

#  Auto Layout
- Auto Layout dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views
- Innovative approach in the iOS world
- Defines your user interface using a series of constraints. Constraints typically represent a relationship between two views
- Support for different screen sizes and orientations

<!-- attr: {class: 'slide-section' } -->
#  Auto Layout
## [Demo](http://)<!-- section start --><!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } --># Storyboards in iOS 9## Questions