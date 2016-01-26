Homework: Objective-C Fundamentals
===================================
**Mandatory use Objective-C as language for the tasks**

## Problem 1. Define class
-	Define a class that holds information about a mobile phone device:
  - model, manufacturer, price, owner, battery characteristics (model, hours idle and hours talk) and display characteristics (size and number of colors)
-	Define 3 separate classes (class `GSM` holding instances of the classes `Battery` and `Display`).

## Problem 2. Initializer methods
-	Define several initializer methods for the defined classes that take different sets of arguments (the full information for the class or part of it
    - At least 3
- Define a factory method for each initializer method  
-	Assume that model and manufacturer are mandatory (the others are optional). All unknown data fill with null.

## Problem 3. Enumeration
-	Add an enumeration `BatteryType` (Li-Ion, NiMH, NiCd, …) and use it as a new field for the batteries
  - Read about enumerations in Objective-C

## Problem 4. `description`
-	Add a method in the `GSM` class for displaying all information about it.
-	Use the `description` method

## Problem 5. Properties
-	Use properties to encapsulate the data fields inside the `GSM`, `Battery` and `Display` classes
-	Ensure all fields hold correct data at any given time
  - Use getters and setters

## Problem 6. Class method
-	Add a class method `IPhone5S` in the GSM class that returns a ready-to-use `GMS` instance

## Problem 7. iOS application

- Create an iOS application to work with the phones
- The application should contain the following scenes:
  - A scene where all `GSM`s are listed
    - Use `UITableViewController` or `UIViewController` with a `UITableView` inside it
    - When a `GSM` is tapped show a scene with details for this `GSM` instance
  - A scene with details about a `GSM`
  - A scene for adding new `GSM`
    - Mandatory fields must be filled
    - Optional fields must be present, but the user may not fill them
    - When a `GSM` is created, navigate to the `List GSMs` scene
      - The new `GSM` should be there
- Use extensively the storyboard and segues
