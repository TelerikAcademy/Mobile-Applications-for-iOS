<!-- section start -->
<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift fundamentals
## Make swiftly iOS development

<div class="signature">
  <p class="signature-course">Mobile Applications for iPhone and iPad</p>
  <p class="signature-initiative">Telerik Software Academy</p>
  <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

<!-- section start -->
<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Table of Contents
- Swift overview
- Language syntax and specifics
  - Variables, structures and  optional values
  - Control structures: if-else, switch, loops

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# Swift Overview
## What and Why?

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift Overview
- Swift is an innovative new programming language for Cocoa and CocoaTouch
  - Writingcode is interactive andfun
  - Thesyntax is concise yetexpressive
  - Apps run lightning-fast
- Swift can be used for creating brand-new iOS and OS X apps
  - Or to add features to applications written with Objective-C

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift Overview
- Swift was introduced at WWDC 2014 as the "new way to create apps for iPhone and iPad"
  - Objective-C without the C
  - Descendant to Objective-C
  - No pointers
  - Functions as first-class objects
  - Influenced from many modern languages:
    - JavaScript, Objective-C, C#, Python, Scala, etc…

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift Experiment Techniques
- Since Swift is pretty new and still needs exploring Apple has provided ways to experiment the new features:
  - REPL (ReadEvalPrint Loop)
    - Run swift code from the Terminal
  - Xcode interactive Playground
    - Immediate code evaluation, while typing

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Using the Swift REPL
- To use the REPL of Swift follow the steps:
  - StartTerminal.app
  - Type
```
$ swift
```
  - Type code directly inside the Terminal
  - The output is shown directly on the Terminal
  - You can also execute code from a swift file:
```
$ swift print-primes.swift
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
# Using the Swift REPL
## Live Demo

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Using the Swift Playground
- Apple has provided a Playground for experimenting with Swift features inside Xcode
  - Write code and receive immediate result
  - Great for exploring Swift features and research
  - Allows fast testing of features and syntax

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
# Going to the Playground
## Live Demo

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# Swift Syntax and Specifics
## Laying the groundwork

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Swift Syntax Overview
- Swift syntax:
  - Variables andcontants
  - Control structures
    - If-else, loops, switch
  - Data structures
    - Arrays, dictionaries,sets
  - Classes and structures
    - Init functions, methods, properties, fields
  - OOP
    - Protocols, extensions, inheritance

<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
# Data types, Variables and Constants
## var and let, primitive and reference, functions

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Data Types in Swift
- Swift supports the common data types, coming from Objective-C
  - `Int` for creating integers numbers
  - `UInt` for creating unsigned integer numbers
  - `Float`, `Double` for floating-point numbers
  - `Bool` for Boolean values
  - `[]` for array, `[Int]` for array of integers
- Swift supports both structures and classes
  - Structures create `primitive types`
  - Classes create `reference types`

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Data Types, Variablesand Constants
- Swift provides two keywords for creating variables:
  - `let` and `var`
- `var` creates a mutable variable
  - Its value can be changed any time
  - The type can be provided or inferred
- `let` creates immutable variable
  - If the type is struct,its value cannot be changed
  - If the type is object, it can be changed only internally

<!-- attr: { hasScriptWrapper:true, showInPresentation:true } -->
# Using let and var
Creating a variable of type integer:
  - Using let
```
letnumberOfCourses:Int= 15
numberOfCourses= 16 // compiler error
```
  - Using var
```
var count :Int= 15
count++ //this is Ok
```
  - Variable types are inferred
    - The compiler will understand that you wantInt
    - Works with let and var
```
letnumberOfCourses= 15
var count = 15
```

<!-- attr: { class:'slide-section demo', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # Using var and let -->
## Live Demo

<!-- section start -->
<!-- attr: { class:'slide-section', hasScriptWrapper:true, showInPresentation:true } -->
<!-- # Swift fundamentals -->
## Questions
