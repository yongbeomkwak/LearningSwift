//
//  FrameView.swift
//  GeometryTest
//
//  Created by yongbeomkwak on 2022/08/07.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        HStack {
            Rectangle().fill(Color.yellow)
                .frame(width: 30)

            VStack {
                Rectangle().fill(Color.blue)
                    .frame(height: 200)

                GeometryReader {
                    self.contents(geometry: $0)
                        .position(x: $0.size.width / 2, y: $0.size.height / 2) //상위 뷰인 VStack의 중간에 위치
                }
                .background(Color.green)
                .border(Color.red, width: 4)
            }
            .coordinateSpace(name: "VStackCS") //이름 부여
        }
        .coordinateSpace(name: "HStackCS") //이름 부여
    }

/// GeometryProxy.frame 다루기
    func contents(geometry g: GeometryProxy) -> some View {
        VStack {
            // 🔥 GeometryReader 자신에 대한 bounds 값을 반환.(그래서 원점 (0,0) 반환)
            Text("Local").bold()
            Text(stringFormat(for: g.frame(in: .local).origin))
                .padding(.bottom)

            // 🔥
            Text("Global").bold()
            Text(stringFormat(for: g.frame(in: .global).origin))
                .padding(.bottom)

            Text("Named VStackCS").bold()
            Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin))
                .padding(.bottom)

            Text("Named HStackCS").bold()
            Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin))
                .padding(.bottom)
        }
    }

/// CGPoint 를 가지고, String 으로 반환.
    func stringFormat(for point: CGPoint) -> String {
        String(format: "(x: %.f, y: %.f)", arguments: [point.x, point.y])
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
