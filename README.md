# SlideMenuSwiftUI

## Overview
SlideMenuSwiftUI is side menu written in SwiftUI .

## Demo
![Alt Text](https://github.com/X901/SlideMenuSwiftUI/blob/main/LTR.gif ) ![Alt Text](https://github.com/X901/SlideMenuSwiftUI/blob/main/RTL.gif)

### its support :
- Dark mode 
- RTL and LTR Language by default
- Gesture to close the menu (swipe right to left to close the menu in LTR lanague or swipe left to right to close menu in RTL language)
- Tap outside the menu to close it

## Installation
Move `Source` folder to you project

## Usage
Modify files inside `Implementation folder`
1. Add name and icon for slidemenu items by modify `MenuItems.swift`.
2. Change menu color by modify `MenuItemStyle.swift`
2. Add PageView for each item by modify `PageView.swift`.

The slideMenu depend on `pageViewIndex` index , index 0 mean user tap on 1st item in slideMenu 

Note : form now on depend on BaseView as you Root View for your application as you can see in Demo Project


