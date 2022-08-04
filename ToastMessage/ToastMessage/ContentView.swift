//
//  ContentView.swift
//  ToastMessage
//
//  Created by yongbeomkwak on 2022/08/04.
//

import SwiftUI
import PopupView

struct ContentView: View {
    
    @State var shouldShowBottomSolidMessage : Bool = false
    @State var shouldShowBottomToastMessage : Bool = false
    @State var showAlert:Bool = false
    
    
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
        //Zstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
