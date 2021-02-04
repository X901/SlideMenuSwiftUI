////
//ItemsToolbar.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct ItemsToolbar: ToolbarContent {
    let title: String
    let menu: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(title)
        }
        
        ToolbarItem(placement: .navigationBarLeading) {
            
                Image("menu")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width:25, height: 25, alignment: .center)
                    .onTapGesture {menu()} 
        }
   
    }
}
