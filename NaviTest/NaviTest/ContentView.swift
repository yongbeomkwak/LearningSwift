//
//  ContentView.swift
//  NaviTest
//
//  Created by yongbeomkwak on 2022/08/02.
//

import SwiftUI
import UIKit


struct DataItem:Hashable {
    var id: UUID
    var title:String
    var color:Color
    
    
    init(title:String, color:Color)
    {
        self.id = UUID()
        self.title = title
        self.color = color
    }
}

struct ItemCell: View {
    
    
    
    @Binding var editMode:EditMode
    var dataItem:DataItem
    @State var selected:Bool = false
    
    
    var body: some View{
        
        HStack{
            
            if(editMode == .active)
            {
                Button {
                    
                    withAnimation(.spring()) {
                        selected =  !selected
                    }
                } label: {
                    
                    Image(systemName: selected == true ? "checkmark.circle.fill" : "circle" )
                    
                }
                
            }
            Text(dataItem.title).onLongPressGesture(minimumDuration: 0.8) {
                withAnimation(.spring())
                {
                    editMode = .active
                }
            }
        }.frame(width:UIScreen.main.bounds.width)
        
        
    }
    
}

struct ContentView: View {
    
    @State var dataList = [DataItem(title: "1번", color: .yellow),DataItem(title: "2번", color: .green),DataItem(title: "3번", color: .orange)]
    @State var editMode:EditMode = .inactive
    @State var draggedItem: DataItem?
    
    var body: some View {
        
        LazyVStack {
            ForEach(dataList, id:\.self) { dataItem in
                
                ItemCell(editMode: $editMode,dataItem: dataItem)
                    .background(dataItem.color)
                
                    .onDrag {
                        self.draggedItem = dataItem
                        return NSItemProvider(item: nil, typeIdentifier: dataItem.title)
                    }
                    .onDrop(of: [dataItem.title], delegate: MyDropDelegate(currentItem: dataItem, editMode: $editMode, dataList: $dataList, draggedItem: $draggedItem))
                
                
                
            }
        }
        .onChange(of: editMode) { mode in
            print(mode)
        }
    }
    
}

struct MyDropDelegate : DropDelegate {
    
    let currentItem: DataItem
    @Binding var editMode:EditMode
    @Binding var dataList:[DataItem]
    @Binding var draggedItem: DataItem?
    
    
    
    // 드랍에서 벗어났을 때
    func dropExited(info: DropInfo) {
        print("MyDropDelegate - dropExited() called")
    }
    
    //드랍 처리 (드랍을 놓을 때 작동)
    func performDrop(info: DropInfo) -> Bool {
        
        print("MyDropDelegate - performDrop() called")
        return true
    }
    
    // 드랍 변경
    func dropUpdated(info: DropInfo) -> DropProposal? {
        // print("MyDropDelegate - dropUpdated() called")
        return nil
    }
    
    // 드랍 유효 여부
    func validateDrop(info: DropInfo) -> Bool {
        print("MyDropDelegate - validateDrop() called")
        return true
    }
    
    //드랍 시작
    
    func dropEntered(info: DropInfo) {
        print("MyDropDelegate - dropEntered() called")
        
        if editMode == .inactive {return}
        
        guard let draggedItem = self.draggedItem else {
            return
        }
        
        if draggedItem != currentItem { //현재 드래그 아이템과 현재 내 아이템과 다르면
            let from = dataList.firstIndex(of: draggedItem)!
            let to = dataList.firstIndex(of: currentItem)!
            
            
            withAnimation {
                //from에서 to로 이동 ,  to > from일 때는 to+1  아니면 to로
                self.dataList.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to+1 : to)
            }
            
        }
        
        
    }
    
    
}
