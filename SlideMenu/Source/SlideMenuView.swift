////
//SlideMenuView.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//


import SwiftUI

struct SlideMenuView: View {
    @Binding var SlideMenuShown : Bool
    @Binding var pageViewIndex : Int
    @EnvironmentObject private var menuItems: MenuItems
    
    var body: some View {
        ZStack {
            Color(.secondarySystemGroupedBackground)
            
            VStack(alignment:.leading) {

                ForEach(0..<menuItems.items.count,id:\.self) { index in
                    
                    Button(action: {
                        pageViewIndex = index
                        SlideMenuShown.toggle()
                    }) {
                        
                        Label(
                            title: {
                                Text(menuItems.items[index].name)
                            },
                            icon: {  menuItems.items[index].icon
                                .resizable()
                                .frame(width: 20, height: 20) })
                            .alignmentGuide(.leading) { d in d[.leading] }
                            .frame(maxWidth: .infinity)

                    }
                    .buttonStyle(MenuItemStyle())

                }
                Spacer()
    
        }
            .padding(.top,50)
     
    }
    
}


struct  SlideMenuView_Previews: PreviewProvider {
    static var menuItems = MenuItems()
    
    static var previews: some View {
        Group {
            SlideMenuView(SlideMenuShown: .constant(false), pageViewIndex: .constant(0))
                .environmentObject(menuItems)
            SlideMenuView(SlideMenuShown: .constant(false), pageViewIndex: .constant(0))
                .preferredColorScheme(.dark)
                .environmentObject(menuItems)
        }
        
    }
}

}

