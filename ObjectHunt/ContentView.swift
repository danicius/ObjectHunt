import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    var videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)?autoplay=1&playsinline=1") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct Content_View: View {
    @State private var videohasIndex = 0  // Index to keep track of the current video
    let store_videoIDs = ["pJHrnQ5TNSY", "Azb8buRwvZM", "CLNQP8lrYIk", "SK29WIUumP8", "D60EQW9xtVQ","AchB01UZe2g","erEgovG9WBs","cJmhs_aMOKQ","l87_dbz2VE8","ntMvooFqnkI","Lf66gVoFjOE","lkIFF4maKMU","O5nskjZ_GoI","SzJ46YA_RaA","q-_ezD9Swz4","H09PmP5tsy8","r9I4DuGmJ2Y","x7X9w_GIm1s","fabelAs_m08","4TUgqm2gJkE","M4ubFru2O80","4gwYkEK0gOk","4RDP-LZoNmU","aBN7_DBa2VQ","4INqzkH7abY","LA6XoiVN1tk","lz4R4FHFr90","WG2IKXDoA2Y","tnb8XcGbYCM","GTXP2FzQS94","MJ5CRZFSlAU","kIID5FDi2JQ","Dru78IHxQE0"
        ,"AvFl6UBZLv4","kF8I_r9XT7A","0cuO5OSDMbw","Z0JvYF0WF1o","UBVV8pch1dM","DFHuu6yZiH8"
        ,"75d_29QWELk","ax0yjzbSBa4","gG7uCskUOrA","GhABWQC3YDs","0lZRAShqft0","iWT0kl1k32M"
        ,"q0a0OX0wnaY","wUVvTqvjUaM"]  // This array stores a list of 50 youtube video IDs

    var body: some View {
        VStack {
            YouTubeView(videoID: store_videoIDs[videohasIndex])
                .frame(width: 900, height: 600)  // Setting a frame for our youtube video to play in

            Button("Load the Next Random Video!!!") {
        
                videohasIndex = Int.random(in: 0..<store_videoIDs.count)
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 34.0)) // Adding a button to load random videos
        }
        .padding()
        .navigationTitle("Random Video Generator on VisionPro!")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

// Setting up the preview for Canvas of SwiftUI
struct Content_View_Previews: PreviewProvider {
    static var previews: some View {
        Content_View()
    }
}
