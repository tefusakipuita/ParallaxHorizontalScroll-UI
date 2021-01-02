//
//  ContentView.swift
//  Parallax Horizontal Scroll
//
//  Created by 中筋淳朗 on 2020/12/05.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State var selected = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color.bg2, Color.bg1]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - Card Scroll
            TabView (selection: $selected) {
                ForEach(1...9, id: \.self) { i in
                    ZStack (alignment: .bottomTrailing) {
                        
                        // MARK: - Main Image
                        GeometryReader(content: { geometry in
                            let minX = geometry.frame(in: .global).minX
                            
                            Image("p\(i)")
                                .resizable()
                                .scaledToFill()
                                .scaleEffect(1.12)
                                // ※ 1. 画像が動かないスクロール用
                                // 35 = 25(padding horizontal) + 10(padding)
                                .offset(x: -minX + 35)
                                // ※ 2. 画像がちょっとだけ動く用
//                                .offset(x: -minX / 3)
                                .frame(width: screenWidth - 70, height: screenHeight / 2)
                                .cornerRadius(15)
                        }) //: GeometryReader
                        .frame(height: screenHeight / 2)
                        .padding(10)
                        .background(
                            Color.white
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                        )
                        .padding(.horizontal, 25)
                        
                        // MARK: - User Image
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                            
                            Image("dog")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } //: ZStack
                        .offset(x: -50, y: 30)
                        
                    } //: ZStack
                    
                } //: ForEach
            } //: TabView
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
