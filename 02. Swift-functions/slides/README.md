<!-- section start -->
<!-- attr: { class:'slide-title', hasScriptWrapper:true, showInPresentation:true } -->
# Swift functions
## Make swiftly iOS development

<div class="signature">
  <p class="signature-course">Mobile Applications for iPhone and iPad</p>
  <p class="signature-initiative">Telerik Software Academy</p>
  <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

<!-- section start -->
<!-- attr: { hasScriptWrapper:true, iOS applications with SwiftshowInPresentation:true } -->
# Table of Contents
- Swift overview
- Language syntax and specifics
  - Functions as first-class objects, closures, etc…

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# Defining Functions in Swift
- Functions in Swift have the following syntax:
  - Function returning void:
```
funcprintMessage(message: String) {
println(String(format: "Message: %@", message))
}
```
  - Function returning integer:
```
funcsum(x:Int, y:Int) -&gt;Int{
return x + y
}
```
  - Function with parameters put inside an array:
```
funcsum(numbers:Int…) -&gt;Int{
var sum = 0
for number in numbers { sum += number}
return sum
}
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
# Functions in Swift
## Live Demo

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # Swift functions -->
## Questions
