//
//  ContentView.swift
//  VolumeControl
//
//  Created by yongbeomkwak on 2022/08/05.
//

import SwiftUI
import Combine
import MediaPlayer
import YouTubePlayerKit

struct ContentView: View {
    let subscriber = Set<AnyCancellable> ()
    let youtubePlayer = YouTubePlayer(source: .url("https://www.youtube.com/watch?v=EkvCyzyrCyU&ab_channel=ESKIM"))
    @StateObject var viewModel2 = viewModel()
    @State var volume:Float = 0
    
    
    var body: some View {
        
        
        YouTubePlayerView(self.youtubePlayer)
        HStack{
            Slider(value:$volume,in:0...100,step:5).onChange(of: volume) { newValue in
                
                self.youtubePlayer.set(volume: Int(volume))
                self.youtubePlayer.isMuted { result in
                    switch result {
                    case .failure(let err):
                        print(err)
                    case .success(let res):
                        print("is mute:? \(res)")
                    }
                }
                youtubePlayer.getVolume(completion: { result in
                    
                    switch result {
                    case .failure(let err):
                        print(err)
                    case .success(let newVolume):
                        
                        print(newVolume)
                        
                    }
                })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView{
    

    
    
    final class viewModel:ObservableObject{
        
        var subscriber = Set<AnyCancellable>()
        var volumeObserver = VolumeObserver()
        @Published var volume:Float = 0 {
            didSet{
                MPVolumeView.setVolume(self.volume)
                print(self.volume)
            }
        }
        func fetchVolume(){
            volumeObserver.volumePublisher().sink { completion in
                
                switch completion{
                case .failure(let err):
                    print("completion Error: \n\(err)")
                case .finished:
                    print("Finish")
                }
            } receiveValue: { [weak self](newVolume:Float) in
                
                guard let self = self else {return}
                
                print("New: \(newVolume)")
                self.volume = newVolume
            }.store(in: &subscriber)
            
           
        }
        init()
        {
            fetchVolume()
        }
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) -> Void {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
   

