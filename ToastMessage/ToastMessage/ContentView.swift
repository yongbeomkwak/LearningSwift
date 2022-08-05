//
//  ContentView.swift
//  ToastMessage
//
//  Created by yongbeomkwak on 2022/08/04.
//

import SwiftUI
import PopupView
import Foundation

struct ContentView: View {
    
    @State var shouldShowBottomSolidMessage : Bool = false
    @State var shouldShowBottomToastMessage : Bool = false
    @State var showAlert:Bool = false
    @State var showAction:Bool = false
    
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing:10){
            
            Image(systemName: "trash")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack{
                Text("토스트 메시지 입니다!")
                    .font(.system(size: 14))
                Text("토스트 메시지 입니다!")
                    .font(.system(size: 14))
                
                Divider().opacity(0)
                
            }.foregroundColor(.white)
            
        }
        .padding(.vertical, 5)
        .padding(.horizontal,10)
        .frame(width:UIScreen.main.bounds.width)
        .background(.purple)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 15)
    }
    
    func createBottomToastMessage() -> some View {
        HStack(spacing:10){
            
            Image(systemName: "circle")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack{
                Text("토스트 메시지 입니다!")
                    .font(.system(size: 14))
                Text("토스트 메시지 입니다!")
                    .font(.system(size: 14))
                
                Divider().opacity(0)
                
            }.foregroundColor(.white)
            
        }
        .frame(width:UIScreen.main.bounds.width)
        .background(.green)
        
    }
    
    var body: some View {
        ZStack{
            VStack(spacing:10){
                Spacer()
                Button {
                    self.shouldShowBottomSolidMessage = true
                } label: {
                    Text("바텀 솔리드 메시지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    
                    self.shouldShowBottomToastMessage = true
                } label: {
                    Text("바텀 토스트 메시지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }
                
                Button("얼럿 띄우기") {
                    
                    showAlert = true
                    
                }.alert("정말 삭제하시겠습니까?", isPresented: $showAlert) {
                    Button(role: .destructive) {
                        print("Delete")
                    } label: {
                        Text("삭제")
                    }
                    
                    Button(role: .cancel) {
                        print("OK")
                    } label: {
                        Text("OK")
                    }
                    
                }
                
                Button {
                    showAction = true
                 
                } label: {
                    Text("액션 시트")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }
                
                
                
                
                
                
                
                
                Spacer()
                
                
                
                
                
            }// Vstack
            .edgesIgnoringSafeArea(.all)
            
        }.popup(isPresented: $shouldShowBottomSolidMessage, type: .toast, position: .bottom, animation: .default, autohideIn: 2,closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomSolidMessage()
        }
        .popup(isPresented: $shouldShowBottomToastMessage, type: .floater(verticalPadding: 20), position: .bottom, animation: .spring(), autohideIn: nil,closeOnTap: true, closeOnTapOutside: true,dismissCallback: {
            print("Dissmiss")
        }) {
            
            self.createBottomToastMessage()
        }
        .popup(isPresented: $showAction, type: .toast, position: .bottom, animation: .easeOut, autohideIn: nil, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: true, backgroundColor: Color(hexcode: "948e95").opacity(0.4)) {
            VolumeSheet()
        }
        //Zstack
    }
}

//
//  VolumeSheet.swift
//  Billboardoo
//
//  Created by yongbeomkwak on 2022/08/05.
//



struct VolumeSheet: View {
    
    
    @State var value:Float = 0
    
    
    var body: some View{
        
        VStack {
            HStack(alignment:.center){
                
                Image(systemName: "speaker.wave.1")
                
                Button {
                    if(value > 0)
                    {
                        self.value -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                }
                
                Slider(value: $value,in:0...100,step:5.0).onChange(of: value, perform: { value in
                    print(value)
                })
                
                Button {
                    if(value < 100)
                    {
                        self.value += 1
                    }
                } label: {
                    Image(systemName: "plus")
                }
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal,10)
            
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 40)
        
        }
        
        
        
        
        
    }
    
    
    
}



struct IntDoubleBinding {
    let intValue : Binding<Int>
    
    let doubleValue : Binding<Double>
    
    init(_ intValue : Binding<Int>) {
        self.intValue = intValue
        
        self.doubleValue = Binding<Double>(get: {
            return Double(intValue.wrappedValue)
        }, set: {
            intValue.wrappedValue = Int($0)
        })
    }
}

struct VolumeSheet_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSheet()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    init(hexcode:String)
    {
        let scanner = Scanner(string: hexcode)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        
        self.init(red:Double(red)/0xff,green: Double(green)/0xff,blue: Double(blue)/0xff)
    }
}
