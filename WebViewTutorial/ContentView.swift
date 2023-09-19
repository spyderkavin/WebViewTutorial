//
//  ContentView.swift
//  WebViewTutorial
//
//  Created by Federico on 27/10/2021.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showWebView = false
    private let urlString: String = "https://mhsmapproject.cocoazi.repl.co"
    
    var body: some View {
        VStack(spacing: 13) {
            // Normal WebView
            WebView(url: URL(string: urlString)!).frame(height: 910.0)
                .frame(width: 382)
                .cornerRadius(10)
                .shadow(color: .yellow, radius: 10.0, x: 5, y: 5)
                
            
            // Create a link that opens in a new window
            Link(destination: URL(string: urlString)!, label: {
                Text("Open in new window")
                    .foregroundColor(.blue)
            })
            
            // Present WebView as a Bottom Sheet
            Button {
                showWebView.toggle()
            } label: {
                Text("Open in a sheet")
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: urlString)!)
            }
            Spacer()
            
        }.padding()
    }
}

// WebView Struct
struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
