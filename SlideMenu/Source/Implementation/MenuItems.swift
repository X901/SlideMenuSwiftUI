////
//MenuItems.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI

// Add The slide menu items (name and icon)
final class MenuItems: ObservableObject {

    @Published var items:[SlideMenuItem] = [
        
        
        SlideMenuItem(name:NSLocalizedString("Page One", comment: "")
                      ,icon:Image(systemName: "house.fill")),
        
        SlideMenuItem(name:NSLocalizedString("Page Two", comment: "")
                      ,icon:Image(systemName: "gearshape.fill"))
    ]
}

struct SlideMenuItem {
    var name : String
    var icon : Image
}
