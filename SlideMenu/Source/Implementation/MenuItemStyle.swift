////
//MenuItemStyle.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI

//Change style of menu items
struct MenuItemStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(height: 10)
            .padding()
            .foregroundColor(configuration.isPressed ? .white : .blue)
            .background(configuration.isPressed ? Color.blue :             Color(.secondarySystemGroupedBackground))
    }
    
}
