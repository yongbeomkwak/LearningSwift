//
//  ContentView.swift
//  YoutubePlayer
//
//  Created by yongbeomkwak on 2022/07/28.
//

import SwiftUI
import YouTubePlayerKit
import Combine
class Temp:ObservableObject {
    
    var now:Int
    var playList:[String] = ["https://youtu.be/fgSXAKsq-Vo","https://youtu.be/DPEtmqvaKqY"]
    var youTubePlayer = YouTubePlayer(source:.url("https://youtu.be/fgSXAKsq-Vo"),configuration: .init(autoPlay:false,showControls: false))
    
    
    var subscriber = Set<AnyCancellable>()
    
    @Published var playTime:Double = 0
    @Published var endTime:Double = -1
    
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
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    
    
    
    
    func next(now:Int) -> Int{
        return now+1
    }
    
    
    
    var body: some View {
        
        ZStack{
            
            VStack{
                YouTubePlayerView(temp.youTubePlayer) { state in
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
                }
                
                
                Text("Hello").onReceive(timer) { _ in
                    
                    temp.youTubePlayer.getDuration { completion in
                        
                        switch completion{
                        case .success(let endTime):
                            print(endTime)
                        case.failure(let err):
                            print("Error")
                        }
                    }
                    
                    temp.youTubePlayer.getPlaybackState { completion in
                        
                        switch completion{
                        case .success(let state):
                            print(state)
                        case .failure(let err):
                            print("Error2")
                        }
                    }
                }
                
                
                Button {
                    isPlay == true ? temp.youTubePlayer.pause():temp.youTubePlayer.play()
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
                    temp.youTubePlayer.load(source: .url(temp.playList[temp.now]))
                    isPlay = true
                    self.temp.increase()
                    temp.youTubePlayer.play()
                    
                    
                    
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
