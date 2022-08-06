//
//  File.swift
//  VolumeControl
//
//  Created by yongbeomkwak on 2022/08/05.
//

import Foundation
import MediaPlayer
import Combine
final class VolumeObserver {

       
//    @Published var volume: Float = AVAudioSession.sharedInstance().outputVolume


//    // Audio session object
//    private let session = AVAudioSession.sharedInstance()

//    // Observer
//    private var progressObserver: NSKeyValueObservation!
//
//    func subscribe() {
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
//            try session.setActive(true, options: .notifyOthersOnDeactivation)
//        } catch {
//            print("cannot activate session")
//        }
//
//        progressObserver = session.observe(\.outputVolume) { [self] (session, value) in
//                self.volume = session.outputVolume
//        }
//
//    }

//    func unsubscribe() {
//        self.progressObserver.invalidate()
//    }
//
//    init() {
//        print("Start subscribe")
//        subscribe()
//    }
    
    func volumePublisher() -> AnyPublisher<Float,Never>
    {
   
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setActive(true)
        } catch let e {
            print("Error")
        }
        
        return audioSession.publisher(for: \.outputVolume)
            .eraseToAnyPublisher()
        
        
       
        
        
    
    }
}
