import SwiftUI
import WebKit

struct YTView: View {
    
    let ytVideoID: String
    
    var body: some View {
        YTVideo(videoID: ytVideoID)
            
    }
}

// A UIViewRepresentable struct to integrate WKWebView into SwiftUI
struct YTVideo: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            print("Invalid YouTube URL")
            return
        }
        
        let request = URLRequest(url: youtubeURL)
        uiView.scrollView.isScrollEnabled = false
        uiView.load(request)
    }
}

// Preview to see how it looks
//#Preview {
//    YTView(ytVideoID: "3uEbkUmS29A")
//}
