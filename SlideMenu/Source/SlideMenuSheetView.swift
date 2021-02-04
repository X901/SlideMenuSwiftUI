////
//SlideMenuSheetView.swift
//SlideMenu
//
//Created by Basel Baragabah on 04/02/2021.
//Copyright © 2021 Basel Baragabah. All rights reserved.
//

import SwiftUI

fileprivate enum Constants {
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.0
}

struct SlideMenuSheetView<Content: View,PageContent:View>: View {
    @Binding var isOpen: Bool
    @Environment(\.layoutDirection) var layoutDirection
    let maxWidth: CGFloat
    let minWidth: CGFloat
    let content: Content
    let pageContent: PageContent
    
    @GestureState private var translation: CGFloat = 0
    
    private var offset: CGFloat {
        isOpen ? 0 : maxWidth - minWidth
    }
    
    
    init(isOpen: Binding<Bool>, maxWidth: CGFloat, @ViewBuilder content: () -> Content, @ViewBuilder pageContent: () -> PageContent) {
        self.minWidth = maxWidth * Constants.minHeightRatio
        self.maxWidth = maxWidth
        self.content = content()
        self.pageContent = pageContent()
        self._isOpen = isOpen
    }
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                self.pageContent.disabled(isOpen ? true : false)
                
                Color(.black).opacity( isOpen ? 0.5 : 0).ignoresSafeArea()
                    .onTapGesture {
                        isOpen.toggle()
                    }
                
            }
            
            HStack(spacing: 0) {
                
                self.content
            }
            .frame(width: self.maxWidth, height:geometry.size.height , alignment: .top)
            .frame(height: geometry.size.height, alignment: .leading)
            .clipped()
            .background(Color(.secondarySystemGroupedBackground))
            .offset(x: -self.offset )
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = layoutDirection == .leftToRight ? value.translation.height : -value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxWidth * Constants.snapRatio
                    guard abs(value.translation.height) < snapDistance else {
                        return
                    }
                    self.isOpen = layoutDirection == .leftToRight ? value.translation.width > 0 : value.translation.width < 0
                }
            )
        }
    }
}

