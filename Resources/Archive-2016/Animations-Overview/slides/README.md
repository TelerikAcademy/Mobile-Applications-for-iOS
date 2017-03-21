<!-- section start -->
<!-- attr: { id:'title', class:'slide-title', hasScriptWrapper:true } -->
# Animations in iOS

<div class="signature">
    <p class="signature-course">Mobile Applications for iPhone and iPad</p>
    <p class="signature-initiative">Telerik Software Academy</p>
    <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

<!-- section start -->
<!-- attr: { id:'table-of-contents' } -->
# Table of Contents

- UIView & CALayer
	- CALayer
	- UIView
- CALayer animations
	- Core animations
	- Implicit animations
	- Explicit animations
- UIView animations
- UIKit Dynamics


# `CALayer` and `UIView`
##  Overview

<!-- attr: {style: 'font-size: 0.9em'} -->
# `CALayer` Overview

- A **layer** captures your content into a bitmap that can be manipulated easily by the graphics hardware
-  In most apps, layers are used as a way to manage the content of views but you can also create standalone layers depending on your needs
-  Every layer can have sublayers
-  Layer objects are 2D surfaces organized in a 3D space and are at the heart of everything you do with **Core Animation**

# `UIView` Overview
- The **UIView** class defines a rectangular area on the screen and the interfaces for managing the content in that area
- View objects are the main way your application interacts with the user. They handle user events
- UIViews are intended to be lightweight wrappers around these CALayers. Every view is backed by a layer

<!-- attr: {class: 'slide-section'} -->
# CALayer animations


<!-- attr: {style: 'font-size: 0.9em'} -->
# Core Animations
- **Core Animation** is a graphics rendering and animation infrastructure available on both iOS and OS X that you use to animate the views and other visual elements of your app.
- **Core Animation** is not a drawing system itself. It is an infrastructure for compositing and manipulating your app’s content in hardware. At the heart of this infrastructure are **layer** objects, which you use to manage and manipulate your content.
- **Core Animation** animates between the current value of the property and the new value you specify.

<!-- attr: {style: 'font-size: 0.9em'} -->
# Layer animations
- With **Core Animation**, most of the work required to draw each frame of an animation is done for you. All you have to do is configure a few animation parameters and tell Core Animation to start.

- Most of the animations you create using Core Animation involve the modification of the layer’s **properties**.  For most of these properties, changing the property’s value results in the creation of an implicit animation whereby the layer animates from the old value to the new value.

<!-- attr: {style: 'font-size: 0.9em'} -->
# Implicit animations
- **Implicit animations** use the default timing and animation properties to perform an animation.
- To trigger **implicit animations**, all you have to do is update the properties of your layer object.
- The visual appearance of the layer objects does not change immediately. What happens instead is that **Core Animation** uses your changes as a trigger to create and schedule one or more implicit animations for execution.

<!-- attr: {style: 'font-size: 0.9em'} -->
# Explicit animations
- **Explicit animations** allows more control over the animating process of your objects
- To create explicit animation, create a **CABasicAnimation** object and use that object to configure the animation parameters. You can set the start and end values for the animation, change the duration, or change any other animation parameters before adding the animation to a layer. To execute the animation, you use the **addAnimation:forKey:** method to add it to the layers you want to animate

# CAKeyframeAnimation
- **CAKeyframeAnimation** object lets you animate through a set of target values in a way that might or might not be linear
- A key frame animation consists of a set of target data values and the times at which each value should be reached. In the simplest configuration, you specify both the values and times using an array

# Multiple changes
- Multiple changes are animated together using **CAAnimationGroup**
- Using a group object simplifies the management of multiple animation objects by providing a single configuration point
- Timing and duration values applied to the group override those same values in the individual animation objects

<!-- attr: {class: 'slide-section'} -->
# CALayer animations
Live demo

# UIView animations
- In **UIKit**, animations are performed using **UIView** objects. Views support a basic set of animations that cover many common tasks
- Animatable UIView properties:
	- Frame, bounds, center
	- Background color
	- Alpha
	- Transform
	- Content stretch
- All animation are diabled by default.

# UIView animations(2)
- In order to animate changes to a property of the **UIView** class, you must wrap those changes inside an **animation block**
	- `animateWithDuration:animations:`
  - `animateWithDuration:animations:completion:`
	- `animateWithDuration:delay:options:animations:completion:`
- In iOS 4 and later, you create an animation block using **block objects**

<!-- attr: {class: 'slide-section'} -->
# UIView animations
Live demo

# UIKit Dynamics
- **UIKit Dynamics** is a full physics engine integrated into UIKit. It allows you to create interfaces that feel real by adding behaviors such as gravity, forces and collisions
- You should define the physical traits that you would like your interface elements to adopt, and the dynamics engine takes care of the rest

# UIDynamicAnimator
- UIKit physics engine
- Keeps track of the various behaviors that you add to the engine and provides the overall context
- When you create an instance of an animator, you pass in a reference view that the animator uses to define its coordinate system

# Behaviors
- The dynamic behaviors actually represent real world physical behaviors implemented into the programming universe
- There are provided multiple behaviors like gravity and collision.
- **UIDynamicItemBehavior** adjusts properties, connected to other behaviors, like velocity, elasticity, density.

<!-- attr: {class: 'slide-section'} -->
# UIKit Dynamics
Live demo
<!-- section start -->
<!-- attr: { id:'questions', class:'slide-section',showInPresentation: true } -->
# Mobile Applications for iPhone and iPad
## Questions
