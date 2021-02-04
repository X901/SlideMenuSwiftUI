////
//BaseView.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI


struct BaseView: View {
    @State private var menuViewSheetShown = false
    @State private var pageViewIndex = 0
    
    private let menuItems = MenuItems()
    
    
    var body: some View {
        
        GeometryReader { geometry in
       
            SlideMenuSheetView(
                isOpen: self.$menuViewSheetShown,
                maxWidth: geometry.size.width * 0.66
            ) {
                if menuViewSheetShown{
                    SlideMenuView(SlideMenuShown: $menuViewSheetShown, pageViewIndex: $pageViewIndex)
                        .environmentObject(menuItems)
                }
                
                
            } pageContent: {
                
                NavigationView {
                    PageView(pageViewIndex: $pageViewIndex)
                        
                        .navigationBarTitle("",displayMode: .inline)
                        .toolbar {
                            ItemsToolbar(title:menuItems.items[pageViewIndex].name ,menu: {
                                self.menuViewSheetShown.toggle()
                            })
                        }
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
       
    }
    
    
}


struct BaseView_Previews: PreviewProvider {
    static var menuItems = MenuItems()
    
    static var previews: some View {
        BaseView().environmentObject(menuItems)
    }
}
