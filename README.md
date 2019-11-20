# Beyond
[![Actions Status](https://github.com/MisterJimson/beyond/workflows/Test/badge.svg)](https://github.com/MisterJimson/beyond/actions)

This is an example app designed to demonstrate my approach to structuring a Flutter app.

I feel like most Flutter content that currently exists focuses on state management and I hope this can dig into other areas a bit more. _Beyond just state management_

I am open to feedback, suggestions, and discussions on how this approach can be improved.

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
A class that contains all the logic and state management for a Page or other component. Provides a way to interact and react to its state. Every Page should have a ViewModel. Other UI components that aren’t Pages can also have ViewModels when needed. See more below about state management.
### Service
A class that provides a way for the app to interact with something outside of its control. Some examples are: web APIs, native device APIs, SDKs. Ideally services should hold minimal amounts of state.
### Manager
A class that holds some global state and provides ways to interact and react to that state.
## State Management
TODO
## Service Location & Dependency Injection
TODO
## Testing
TODO
## Configuration
TODO