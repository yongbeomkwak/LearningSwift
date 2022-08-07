//
//  ContentView.swift
//  GeometryTest
//
//  Created by yongbeomkwak on 2022/08/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            GeometryReader { geomotry in
                
                Text("Geometry Reader")
                    .font(.largeTitle.bold())
                
                    .position(x: geomotry.size.width / 2, y: geomotry.safeAreaInsets.top) // 가로 중간 및 , 높이는 안전영역 위에
                
                
                VStack{
                    Text("Size").bold()
                    
                    Text("width : \(Int(geomotry.size.width))")
                    Text("Height : \(Int(geomotry.size.height))")
                }.position(x: geomotry.size.width/2, y: geomotry.size.height / 2.5)
                // VStack을 geomotry.size.width 중간에 위치 , y: geomory 높이/2.5에 위치
                
                VStack {
                    Text("SafeAreaInsets").bold()
                    // 🔥
                    Text("top : \(Int(geomotry.safeAreaInsets.top))")
                    Text("bottom : \(Int(geomotry.safeAreaInsets.bottom))")
                }
                // 🔥
                .position(x: geomotry.size.width / 2, y: geomotry.size.height / 1.4)
                // VStack을 geomotry.size.width 중간에 위치 , y: geomory 높이/1.4에 위치
                
                
            }
            .font(.title)
            .frame(height:500)
            .border(.green,width: 5)
        }
        
        Rectangle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
