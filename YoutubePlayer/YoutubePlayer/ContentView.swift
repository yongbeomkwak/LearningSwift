//
//  ContentView.swift
//  YoutubePlayer
//
//  Created by yongbeomkwak on 2022/07/28.
//

import SwiftUI
import YouTubePlayerKit

class Temp:ObservableObject {
    var now:Int
    var playList:[String] = ["https://youtu.be/fgSXAKsq-Vo","https://youtu.be/DPEtmqvaKqY"]
    
    init()
    {
        self.now = 0
    }
    
    func increase()
    {
        self.now = now+1
    }
    
    
    
}

struct ContentView: View {
    
    @State var isPlay:Bool = false
    @StateObject var temp = Temp()
    
    
    var youTubePlayer = YouTubePlayer(configuration: .init(autoPlay:false))
    
        
    func next(now:Int) -> Int{
        return now+1
    }
    
    
    
    var body: some View {
        
        ZStack{
           
            VStack{
                YouTubePlayerView(self.youTubePlayer) { state in
                    // Overlay ViewBuilder closure to place an overlay View
                    // for the current `YouTubePlayer.State`
                    switch state {
                    case .idle:
                        ProgressView()
                    case .ready:
                        EmptyView()
                    case .error(let error):
                        Text(verbatim: "YouTube player couldn't be loaded")
                    }
                }.frame(width: 0, height: 0)
                
                Button {
                    isPlay == true ? youTubePlayer.pause():youTubePlayer.play()
                    isPlay = !isPlay
                } label:  {
                    if isPlay == true {
                        Text("Pause")
                    }
                    else{
                        Text("Play")
                    }
                }
                
                Button{
                    youTubePlayer.load(source: .url(temp.playList[temp.now]))
                    isPlay = true
                    self.temp.increase()
                    youTubePlayer.play()
                    
                    
                    
                } label: {
                    Text("Next")
                }
                
            }
            
            
            
            
            
            
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
