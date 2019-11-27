# Beyond
[![Actions Status](https://github.com/MisterJimson/beyond/workflows/Test/badge.svg)](https://github.com/MisterJimson/beyond/actions)

This is an example app designed to demonstrate my approach to structuring a Flutter app.

I feel like most Flutter content that currently exists focuses on state management and I hope this can dig into other areas a bit more. _Beyond just state management_

I am open to feedback, suggestions, and discussions on how this approach can be improved.

It's important to note that this is not meant to prescribe how everyone should write Flutter apps nor that this is the best option for every project.

### Goals
- Simple
- Clean
- Testable
- Consistent
- Don't reinvent the wheel, use libraries when appropriate

## Architecture & Naming Conventions
TODO
### Page
A Widget that takes up the entire view of your application and can be navigated to and from. Pages contain other Widgets that are used to compose UI.
### ViewModel
A class that contains all the logic and local state for a Page or other component. Provides a way to interact with and react to that state. Every Page should have a ViewModel. Other UI components that are not Pages can also have ViewModels when needed. See more below about state management.
### Service
A class that provides a way for the app to interact with something outside of its control. Some examples are: web APIs, native device APIs, SDKs, and databases. Ideally services should hold minimal amounts of state.
### Manager
A class that holds global state and provides ways to interact with and react to that state.
## State Management
There are many articles and discussions on state management for Flutter so I will only touch on this briefly.

Lets define what state management is when it comes to writing a Flutter app.

State management is...
- How the app interacts with data
- How the app reacts to changes in data
- How the app organizes code related to doing the above

If you look at the above statements and compare them to using `StatefulWidgets` and `setState` you will come to a few limitations when working on a large app.
- App state and UI are tied closely together 
- Ties rebuilding UI to the same scope as your state
- Makes it hard to separate UI code from "business logic"

The above can be challenging when building a large application. There are a few alternative approaches built into Flutter and many third party libraries that each have different ways of solving for this.

MobX is the library used for state management here and the below section will expand on why.
### Why MobX?
There are a few primary reasons why MobX is the preferred choice for state management.
TODO
## Service Location & Dependency Injection
TODO
## Testing
TODO
## Configuration
TODO