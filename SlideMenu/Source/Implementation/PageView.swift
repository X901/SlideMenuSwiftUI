////
//PageView.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI

// Change SwiftUI view depend on pageViewIndex
struct PageView: View {
    @Binding var pageViewIndex : Int
    
    var body: some View {
       
        if pageViewIndex == 0 {
            PageOneView()
            
        } else if pageViewIndex == 1 {
            PageTwoView()
        }
    }
}

struct PageView_Previews: PreviewProvider {

    static var previews: some View {
        PageView(pageViewIndex: .constant(0))
    }
}
