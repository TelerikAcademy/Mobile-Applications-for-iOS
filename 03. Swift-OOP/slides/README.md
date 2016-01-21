<!-- section start -->
<!-- attr: { class:'slide-title', hasScriptWrapper:true, showInPresentation:true } -->
# Swift OOP
## Make swiftly iOS development

<div class="signature">
  <p class="signature-course">Mobile Applications for iPhone and iPad</p>
  <p class="signature-initiative">Telerik Software Academy</p>
  <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

<!-- section start -->
<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Table of Contents
- Language syntax and specifics
  - OOP: classes, protocols, enums, extensions
  - Syntactic sugar: destructuring assignments

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# Classes and Structures
## Introducing the OOP principles in Swift

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift Classes
- Swift is an OOP language
  - Has classes, structures and protocols

```
class Square{
	var x: Float
	var y: Float
	var side: Float
	init(x: Float, y: Float, side: Float){
		self.x = x
		self.y = y
		self.side = side
	}

	func calcArea() -&gt; Float{
		return self.side * self.side
	}
}
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
# Creating Simple Classes
## Live Demo

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Protocols in Swift
- Protocols in Swift are pretty much the same as in Objective-C
  - Almost like interfaces in C# and Java
  - They provide a public interface for the conforming classes to implement

```
protocol Movable{
	func moveToX(x: Int, y: Int)
	func moveByDx(dx: Int, dy: Int)
}
class Shape: Movable{
	func moveToX(x: Int, y: Int){
		//implementation
	}
	func moveByDx(dx: Int,dy: Int){
		//implementation
	}
}
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # Protocols in Swift -->
## Live Demo

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# UIKitAnimations
## 

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
<!-- # UIKitAnimations -->
- A limited number of animatable propeerties
- Custom animatable properties cannot be created
- All animations are disabled by default
- Animations are enabled only when using special constructs

```
let view = UIView(frame: CGRectMake(x, y, w, h))

UIView.animateWithDuration( 1.0
	animations: {
		let frame = CGRectMake(x + 100,
								y + 100,
								w,
								h)
		view.frame = frame
});
```

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# UIKitAnimations: Animation Blocks
- UIKitAnimations with Animation Blocks

```
UIView.animateWithDuration( 1.0
                     delay: 1.0
                   options: UIViewAnimationOptions.CurveEaseIn
                animations: {
                    let frame = CGRectMake(x + 100,
                                            y + 100,
                                            w,
                                            h)
                    view.frame= frame
},
               completion: {
                  view.alpha = 0.5
});
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # UIKitAnimations -->
## Live Demo

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # Swift OOP -->
## Questions
