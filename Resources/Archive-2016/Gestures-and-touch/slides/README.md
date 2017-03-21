<!-- section start -->
<!-- attr: { id:'title', class:'slide-title', hasScriptWrapper:true } -->
# Gestures & Touch in iOS
##  Swiping, Touching and more...
<div class="signature">
    <p class="signature-course">Mobile Applications for iPhone and iPad</p>
    <p class="signature-initiative">Telerik Software Academy</p>
    <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

<!-- section start -->
<!-- attr: { id:'table-of-contents' } -->

# Table of contents
- Gesture recognizers
	- Built-in types
	- Discrete and continuous gestures
	- Gesture recognizers interaction
- Gestures recognizers in action
	- With storyboards
	- With code
- UIResponder touch events
- Custom gestures

<!-- attr: {style: 'font-size: 0.9em'} -->
# Gesture recognizers
-  Objects that you attach to a view, which allows the view to respond to actions the way a control does
-  Gesture recognizers interpret touches to determine whether they correspond to a specific gesture, such as a swipe, pinch, or rotation
  - If they recognize their assigned gesture, they send an action message to a target object.
-  Gesture recognizers operate in a finite state machine
-  Gesture recognizers allow you to separate the recognition of a touch from the action that the touch produces

# Types
- The **UIKit** framework provides predefined gesture recognizers that detect common gestures.
	- Tapping (any number of taps)
	- Pinching in and out (for zooming a view)
	- Panning
	- Swiping (in any direction)
	- Rotating (fingers moving in opposite directions)
	- Long press

<!-- attr: {style: 'font-size: 0.9em'} -->
# Discrete & continuous gestures
- Gestures are either discrete or continuous
- **Discrete gestures** are represented by x y coordinates that correspond to a particular point or area in the UI (Tap)
- A **continuous gesture**, such as **pinching**, takes place over a period of time
- For **discrete gestures**, a gesture recognizer sends its target a single action message while a gesture recognizer for **continuous gestures** keeps sending action messages to its target until the multitouch sequence ends

<!-- attr: {class: 'slide-section'} -->
# Gesture recognizers
##  [Demo](http://)

<!-- attr: {style: 'font-size: 0.9em'} -->
# Interaction between recognizers
-  By default, there is no set order for which gesture recognizers receive a touch first, and for this reason touches can be passed to gesture recognizers in a different order each time.You can override this default behavior to:
	- Specify that one gesture recognizer should analyze a touch before another gesture recognizer
	- Allow two gesture recognizers to operate simultaneously
	- Prevent a gesture recognizer from analyzing a touch

  <!-- attr: {class: 'slide-section'} -->
#  Interaction between recognizers
##  [Demo](http://)

# UIResponder touch events
-  Used when there is no benefit to decoupling the touch recognition from the effect of the touch.
-  Allows more control over the gesture phases
-  There are corresponding methods to every touch phase: Began, Moved, Ended, and Canceled

# Handling touch events
- Create a subclass of **UIResponder** (UIView, UIViewController, etc.)
- The view receiving touches must have its **userInteractionEnabled** property set to YES. If you are subclassing a view controller, the view that it manages must support user interactions
- The view receiving touches must be visible; it can’t be transparent or hidden

<!-- attr: {style: 'font-size: 0.9em'} -->
# Handling touch events(2)
- iOS recognizes touches as part of a multitouch sequence
  - During a multitouch sequence, the app sends a series of event messages to the target responder
  - To receive and handle these messages, the responder object’s class must implement the following **UIResponder** methods

```objectivec
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
```

# Capturing custom gestures

- Custom gesture recognizers
- The heart of the implementation for a custom gesture recognizer are the four methods: touchesBegan:withEvent:, touchesMoved:withEvent:, touchesEnded:withEvent:, and touchesCancelled:withEvent:
- Within these methods, you translate low-level touch events into gesture recognition by setting a gesture recognizer’s state


<!-- ---------------------------- -->
<!-- section start -->
<!-- attr: { id:'questions', class:'slide-section',showInPresentation: true } -->
# Questions
## iOS Gestures and Touch
[link to the forum](http://telerikacademy.com/Forum/Category/62/ios-mobile-apps)
