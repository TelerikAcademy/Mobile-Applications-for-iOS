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

- Classes and Structures
  - Properties
    - Stored properties
    - Lazy properties
    - Computed properties
    - Property observers
  - Methods
    - Instance and Class

<!-- attr: {showInPresentation: true} -->
<!-- # Table of Contents -->

- Inheritance
  - Subclassing
  - Reusing parent's state and behavior
  - Overriding methods and properties
  - Preventing sublcassing
- Protocols
  - Conforming to protocols
- Extensions

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
<!-- # Swift OOP -->
## Questions
