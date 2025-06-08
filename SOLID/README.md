[freecodecamp blog](https://www.freecodecamp.org/news/solid-principles-explained-in-plain-english/)

Here is a detailed example illustrating the benefit of using each SOLID principle along with the drawback if that principle is not applied:

---

## Single Responsibility Principle (SRP)

**Benefit Example:**  
Consider a `User` class that currently handles both user data management and sending email notifications. Applying SRP, you split this into two classes: `User` (manages user data) and `EmailService` (handles email notifications). This separation means changes to email logic won’t affect user data management.

**Drawback if Not Applied:**  
If both responsibilities remain in one class, changes to email sending (e.g., switching email providers) risk breaking user data logic. The class becomes harder to maintain and test due to mixed responsibilities.

---

## Open/Closed Principle (OCP)

**Benefit Example:**  
Suppose you have a `Shape` interface with a method `draw()`. You implement `Circle` and `Rectangle` classes. Later, to add a new shape like `Triangle`, you simply create a new class implementing `Shape` without modifying existing code.

**Drawback if Not Applied:**  
If you modify existing classes to add new shapes, you risk introducing bugs and breaking tested functionality. The system becomes fragile and difficult to extend.

---

## Liskov Substitution Principle (LSP)

**Benefit Example:**  
Imagine a base class `Bird` with a method `fly()`. Subclasses like `Sparrow` override `fly()` correctly. A `Penguin` subclass, however, cannot fly. To adhere to LSP, `Penguin` should not inherit `Bird` or `fly()` should be refactored so substituting `Penguin` does not break client code.

**Drawback if Not Applied:**  
If `Penguin` inherits `Bird` and clients expect all birds to fly, substituting `Penguin` breaks functionality, causing runtime errors or unexpected behavior.

---

## Interface Segregation Principle (ISP)

**Benefit Example:**  
A `Printer` interface includes methods `print()`, `scan()`, and `fax()`. A simple printer only supports `print()`. Applying ISP, split into smaller interfaces: `IPrinter`, `IScanner`, `IFax`. The simple printer implements only `IPrinter`.

**Drawback if Not Applied:**  
Clients are forced to implement unused methods, leading to bloated classes and violating the principle of minimal interface dependency.

---

## Dependency Inversion Principle (DIP)

**Benefit Example:**  
A `ReportGenerator` depends on an abstraction `IDataSource` rather than a concrete `Database` class. This allows switching to a `FileDataSource` or `ApiDataSource` without changing `ReportGenerator`.

**Drawback if Not Applied:**  
If `ReportGenerator` depends directly on `Database`, changing data source requires modifying `ReportGenerator`, increasing coupling and reducing flexibility.

---

### Summary Table

| SOLID Principle               | Benefit Example                                         | Drawback if Not Applied                              |
|------------------------------|--------------------------------------------------------|-----------------------------------------------------|
| Single Responsibility (SRP)  | Separate user data and email notification classes      | One class with mixed responsibilities, hard to maintain |
| Open/Closed (OCP)            | Add new shape classes without modifying existing code  | Modifying existing classes risks bugs and fragility |
| Liskov Substitution (LSP)    | Subclasses fully substitutable without breaking code   | Subclass breaks client expectations, causing errors |
| Interface Segregation (ISP)  | Split interfaces so clients implement only needed methods | Clients forced to implement unused methods          |
| Dependency Inversion (DIP)   | Depend on abstractions to allow flexible data sources  | High coupling to concrete classes reduces flexibility |

---

Applying SOLID principles improves maintainability, scalability, and testability, while ignoring them leads to fragile, tightly coupled, and hard-to-maintain code. However, overuse may increase complexity and development effort, so balance is key.
