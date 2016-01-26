<!-- section start -->
<!-- attr: { class:'slide-title', showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# Methods in Objective-C
##  Subroutines in Computer Programming
<div class="signature">
    <p class="signature-course">Telerik Software Academy</p>
    <p class="signature-initiative">http://academy.telerik.com </p>
    <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<img class="slide-image" src="imgs/pic.png" style="width:80%; top:10%; left:10%" />

<!-- attr: { showInPresentation:true, hasScriptWrapper:true, style:'' } -->
# Table of Contents
- Methods Overview
- Declaring Methods
  - Return type
  - Using Parameters
- Instance and Class methods

<img class="slide-image" src="imgs/pic.png" style="width:80%; top:10%; left:10%" />

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Methods Overview
##  What are Methods?

<!-- attr: { showInPresentation:true, style:'' } -->
# Methods Overview
- A method is `a named piece of code`
  - And can be executed only by using the method name (identifier)
  - A method has executing context 
    - Either object or class
- Methods are pretty much the same as functions
  - But methods belong to a class or an object
  - Functions are declared separated from classes

<!-- attr: { showInPresentation:true, style:'' } -->
# Using Methods
- Methods are invoked by sending a message to an object or class
  - Send message "introduce" to object "person"
- [person introduce];
- [numbersArray addObject: number];
  - Send a message "addObject" to object "numbersArray" with parameter "12.3"

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Using Methods -->
##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Declaring Methods

<!-- attr: { showInPresentation:true, style:'' } -->
# Declaring Methods
- Methods must be declared inside the class body
  - Methods declared inside the `.h file` are `public`
  - Methods declared inside the `.m file` are `private`
- `Public` `methods` are accessible from `everywhere`
- `Private `are accessible `only from the class` they belong to

<!-- attr: { showInPresentation:true, style:'' } -->
# Declaring Methods:Class or Instance
- -/+ (return_type) methodName: parameters
- {
-   //method body
- }
- Method declaration has the structure

<!-- attr: { showInPresentation:true, style:'' } -->
# Declaring Methods:Class or Instance
  - + means the method is a class method
    - The message is send to the object itself
  - – means the method is an instance method
    - The message is sent to an instantiated object
- -/+ (return_type) methodName: parameters
- {
-   //method body
- }
- Method declaration has the structure

<!-- attr: { showInPresentation:true, style:'' } -->
- -/+ (return_type) methodName: parameters
- {
-   //method body
- }
# Declaring Methods:Return Type
  - The return type can be of any Objective-C type
    - int, double, NSString, char
    - NSArray, NSDictionary
    - Even function (Function pointer)
- Method declaration has the structure

<!-- attr: { showInPresentation:true, style:'' } -->
# Declaring Methods:Identifier
  - The identifier must be any valid Obj-C name
    - Any Latin letter
    - Digits, cannot start with a digit
    - Underscore _ 
- -/+ (return_type) methodName: parameters
- {
-   //method body
- }
- Method declaration has the structure

<!-- attr: { showInPresentation:true, style:'' } -->
# Declaring Methods:Parameters
  - The parameters of a method can be 0 or more
    - Each parameter has a type
  - The parameters are part of the method name
  - Each parameter has two names
    - One that is part of the method identifier
    - One to be used inside the method
- -/+ (return_type) methodName: parameters
- {
-   //method body
- }
- Method declaration has the structure

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Declaring Methods -->
##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Method Parameters

<!-- attr: { showInPresentation:true, style:'' } -->
# Method Parameters
- Any method can have 0 or more parameters
  - Any parameter has two names
    - One is part of the method identifier and signature
    - The other is the variable identifier, used inside the method body
- Given the method:
  - Its signature is `–(id) initWithFirstname:andLastname`
- -(id) initWithFirstname: (NSString x) fname               
-              andLastname: (NSString x) lname
- { … }

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Method Parameters -->
##  [Demo]()

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# Instance and Class Methods
##  What is the difference?

<!-- attr: { showInPresentation:true, style:'' } -->
# Instance and Class Methods
- Instance methods are executed in the context of an object
  - They can read the state of the object
  - They can change the state of the object
- Class methods are shared methods for all instances of a class
  - They are executed in the context of the class
  - They cannot use the state of instances

<!-- attr: { showInPresentation:true, style:'' } -->
# Defining Class and Instance Methods
- Both types of methods have the same form
- +/- (return_type) methodName: parameters
- {
-   //method body
- }
  - The way to specify if the methods is class or instance is:
    - – (minus) means instance method
    - + (plus) means class method

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Instance and Class Methods -->
##  [Demo]()

<!-- attr: { showInPresentation:true, style:'' } -->
# Homework
- Create a class Calculator for performing mathematical operations with floating-point numbers:
  - Save the current result
  - Add a value to the result
  - Divide the result by a given divider
  - Subtract a value from the result
  - Multiply the result by a given value

<!-- attr: { showInPresentation:true, style:'' } -->
# Homework
- Create a simple class for keeping a database with TODOs
  - The user should be able to add TODO with a end date
  - The user should be able to list all TODOs
- xUse the above class to create an iOS application with UI

