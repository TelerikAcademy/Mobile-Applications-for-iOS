<!-- section start -->
<!-- attr: {id: 'title', class: 'slide-title', hasScriptWrapper: true} -->
# Objective-C Fundamentals
##  The Basic Concepts in Obj-C

<div class="signature">
    <p class="signature-course">Telerik Software Academy</p>
    <p class="signature-initiative">http://academy.telerik.com </p>
    <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Table of Contents
- Data types and variables
  - Number types and strings
- Conditional statements and constructions
- Loops
- Arrays
  - Mutable and immutable
- Functions

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Data Types and Variables -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Data Types and Variables
- Objective-C supports all of the standard primitive types
  - `Integer `and `floating-point` numbers
  - `Characters` and `Strings`
  - Something like a `Boolean type`

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Number Types -->

<!-- attr: { showInPresentation:true, hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Integer and Floating-point

- Objective-C supports different types of numbers
  - Using modifiers to change the range of values
- Types:
  - `char`, `int`, `double `and `float`
- Modifiers:
  - `unsigned`, `long`, `short` and `long` `long`
- Apple suggests using their typedefs
    - `NSInteger`, `NSUInteger`, `CGFloat`, etc…


<!-- attr: {class: 'slide-section',showInPresentation: true, style:'font-size:38px'} -->
<!-- # Number Types in Objective-C
## [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Boolean Type -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Boolean Type
- Objective-C has no true Boolean (Yes/No)
  - It has Yes-like and No-like values
  - The values `nil`, `Null`, `0` and `@""` are `No-like`
  - Everything else is `Yes-like`
    - `1`, `2`, `1.2`, `@"any string"`, etc…
- There is a `BOOL` type that is just a `typedef`:
  - i.e. `BOOL` is just a `signed char`

```objective-c
typedef signed char BOOL;
#define OBJC_BOOL_DEFINED
#define YES (BOOL)1
#define NO (BOOL)0
```

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Boolean Type
##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# NSNumber
- NSNumber is a type that holds numbers
  - Any number from short to int to unsigned long
  - It is a object type
  - The only way to put a number into a collection
    - NSArray, NSDictionary, etc…

```objective-c    
NSNumber xintNumber = @123; //NSNumber with int
NSNumber xlongNumber = @123l; //NSNumber with long
NSNumber xdoubleNumber = @123.3;
NSNumber xboolNumber = @YES;
```

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # NSNumber
## [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
# The String Type

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# The String Type
- To define a string use the `NSString` type
  - Has a literal to set its value directly
    - Using the `"string value"` and a `prefix @`

```objective-c
NSString xstr = @"Literal";
```

- The `string is immutable` type
  - i.e. once set, it cannot be changed

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# The Mutable String
- To create a mutable string, use the `NSMutableString` type
  - Creates a string that can be changed
  - Created as a regular string – using the literal
  - Has methods for appending string at the end

```objective-c
NSMutableString xstr = @"";
[str appendString:"new str"];
```

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Strings
##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Strings Concatenation
- Strings can be concatenated
  - The result is the second string appended at the end of the first string
- Concatenation is done using the methods:
  - `stringByAppendingString: (NSStringx)]`
  - `stringByAppendingFormat: (NSStringx), …]`
- Since `NSString` is immutable, both return a `new string object`

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Concatenating Strings
##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Slow String Concatenation
- Concatenating strings using the stringByAppendingx is very slow
  - For every concatenation, a new string object is allocated and initialized in memory
  - Since NSString is an immutable, n objects  are allocated, then deallocated, for concatenating n strings
- When in need of multiple string concatenations use `NSMutableString`
  - Has methods appendStringx: (NSStringx)
  - Allocates only O(log2(n)) objects

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Faster String Concatenation
##  [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Conditional Statements
##  Make the Code Run Conditionally -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Conditional Statements
- Objective-C supports the `if-else` construction

```objective-c
if(condition)
{
  //run code
}
else if(second-condition)
{
  //run other code
}
else
{
  //run third code
}
```

- The condition can be of any type
  - `nil`, NO and 0 are evaluated as false conditions

<div class="fragment balloon" style="width:250px; top:25%; left:40%">Evaluated if the first condition is false</div>
<div class="fragment balloon" style="width:250px; top:55%; left:40%">Executed if all the conditions are false</div>


<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Conditionals: if-else
##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Switch-Case Construction
- `Switch-case` is a construction similar if-else
  - Checks the value of a given object
    - The object must be either number, BOOL or enum
  - If the object has a value equal to any of the cases the code in this case is executed
```objective-c
switch(choice)
{
  case 1: // the code for this case
  break;
  case 2: // the code for this case
  break;
  default: //default behavior
  break;
}
```

<div class="fragment balloon" style="width:250px; top:50%; left:60%">Missing break applies the fall-thought rule</div>
<div class="fragment balloon" style="width:250px; top:70%; left:60%">Acts like the final else in if-else construction</div>

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Conditionals:Switch-case
##  [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Loops
##  Create repeating parts of code -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Loops in Objective-C
- Loops enable the `execution` of code `multiple times`
  - The number of loop iterations can be `exact` or `while a condition is fulfilled`
- Objective-C supports `four kinds `of loops:
  - `for `– makes an exact number of iterations
  - `for-in `– iterates through a collection of objects
  - `while `– runs the code until a condition is fulfilled
  - `do-while` – the same as while

  <!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# For Loop
- `for `runs a block of code a number of times

```objective-c
for(initialization; condition; increment)
{
  //execute code;
}
```
- `Initialization` is used to set the initial state
  - i.e. set the start of a counter
  - `Condition` checks if the state is still valid and whether the loop should continue or stop
- `Increment` means update
  - Change the state of the loop


<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # For Loop -->
<!-- ##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# For-in Loop
- `for-in` is used to `iterate over collection` of objects

```objective-c
for(type xobj in collection)
{
  //code
}
```
  - Iterates through the objects stored in a collection
  - Can be used only with collections
    - `NSArray`, `NSDictionary`, `NSSet`, etc..
  - `obj` gets all the values from the collection

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # For-in Loop -->
<!-- ##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# While Loop
- The `while` loop executes a piece of code, `while a given condition is fulfilled`

```objective-c
while(condition)
{
  //code
}
```
  - Condition is evaluated at every iteration of the loop
    - If it is `YES`, the loop `continues execution`
    - If it is `NO`, the loop `stops its execution`
  - If the condition has an `initial value NO `the code in the loop is `not executed`

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # While Loop -->
<!-- ##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Do-while Loop
- The `do-while` loop is pretty much like while
  - Has a slightly different construction
  - If the initial value of the `condition is NO`, the code is `executed exactly once`

```objective-c
do {
  //code
} while(condition)
```

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Do-while Loop -->
<!-- ##  [Demo]() -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Nesting Loops
- Loops can be `nested inside one another`
  - The code inside a loop block can contain indefinite number of other loops

```objective-c
for(…)
{
  while(…)
  {
 //code
  }
  for(id value in array)
  {
 //code
  }
}
```

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Nested Loops
##  [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Arrays -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Arrays
- Arrays are objects that `hold other objects`
  - Also known as collections
- Each object can be accessed via an index
  - Indexes range from 0 to the number of objects in the array minus 1
- Arrays can hold objects of any type
  - `Numbers `must be wrapped into `NSNumber`

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Arrays (2)
- Many ways to create arrays
  - Most common is:
- NSArray xarr = @["one", @"two", @"three", nil];
  - `NSArray` is `immutable`
    - i.e. it cannot be changed
- To create a changeable array use `NSMutableArray`

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Creating Arrays
##  [Demo]() -->

<!-- section start -->
<!-- attr: { class:'slide-section', showInPresentation:true, style:'' } -->
<!-- # Functions -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C
- Functions are `named pieces of code`
  - The code inside a function can be executed using the function identifier

```objective-c
int max(int n1, int n2)
{
  if(n1 > n2) return n1;
  else return n2;
}
int main()
{
  NSLog(@"%d", max(1,5))
}
```

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C
- Functions are `named pieces of code`
  - The code inside a function can be executed using the function identifier
- Identifier: `max`

```objective-c
int max(int n1, int n2)
{
  if(n1 > n2) return n1;
  else return n2;
}
int main()
{
  NSLog(@"%d", max(1,5))
}
```

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C
- Functions are `named pieces of code`
  - The code inside a function can be executed using the function identifier
- Identifier: `max`
- Return type: `int`

```objective-c
int max(int n1, int n2)
{
  if(n1 > n2) return n1;
  else return n2;
}
int main()
{
  NSLog(@"%d", max(1,5))
}
```

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C
- Functions are `named pieces of code`
  - The code inside a function can be executed using the function identifier
- Identifier: `max`
- Return type: `int`
- Parameters: `n1 `and` n2`

```objective-c
int max(int n1, int n2)
{
  if(n1 > n2) return n1;
  else return n2;
}
int main()
{
  NSLog(@"%d", max(1,5))
}
```

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C
- Functions are `named pieces of code`
  - The code inside a function can be executed using the function identifier
- Identifier: `max`
- Return type: `int`
- Signature: `int(int, int)`
- Parameters: `n1 `and` n2`

```objective-c
int max(int n1, int n2)
{
  if(n1 > n2) return n1;
  else return n2;
}
int main()
{
  NSLog(@"%d", max(1,5))
}
```

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Functions in Objective-C (2)
- Every function has the following:
  - `Identifier`: the name of the function
  - `Return` `type`: int, NSArray, id or void
  - `Parameters: `0 or more parameters passed to the function
- Returning void means that the `function returns no result`
  - And the caller of the function shouldn't expect any

<!-- attr: { class:'slide-section demo', showInPresentation:true, style:'' } -->
<!-- # Functions
##  [Demo]() -->

<!-- attr: { class:'slide-section', showInPresentation: true } -->
<!-- # Questions
##  Objective-C Fundamentals -->

<!-- attr: { hasScriptWrapper: true, style: 'font-size: 40px'} -->
# Homework
- Create a matrix (array of arrays) that contains integer values using the schema and print them to the console
- Create a function that generates the above matrix by a given N
