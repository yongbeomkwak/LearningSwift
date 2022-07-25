//
//  SwiftUIView.swift
//  RandomUserApi
//
//  Created by yongbeomkwak on 2022/07/25.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    var imageUrl: URL
    var body: some View {
        URLImage(imageUrl) { image in
            image.resizable().aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.init(uiColor: .yellow),lineWidth: 2))
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/45.jpg")!
        
        
        ProfileImageView(imageUrl: url)
    }
    
    

}
