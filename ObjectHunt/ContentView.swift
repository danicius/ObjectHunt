//
//  ContentView.swift
//  ObjectHunt
//
//  Created by Danielle Alvarez on 4/5/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import WebKit

struct YouTubeView: UIViewRepresentable {
    var videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @State private var gifUrl: URL?
    @State private var showFeelView = false
     @State private var showCoolView = false
     @State private var showFetchView = false
    @State private var videoID = "pJHrnQ5TNSY"  // Example video ID

    

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        
       
            VStack {
                YouTubeView(videoID: videoID)
                                .frame(height: 400)
                                .frame(width:700)
                
                            Button("Load Random Video") {
                                // Here you would change the videoID to a new random video
                                
                                videoID = "newRandomVideoID"  // Replace with actual logic to fetch a new ID
                            }
                
                
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
        
            .padding(.vertical)
            .navigationTitle("Random Video Generator on VisionPro!")
            .navigationBarTitleDisplayMode(.automatic)
            
        
    
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
