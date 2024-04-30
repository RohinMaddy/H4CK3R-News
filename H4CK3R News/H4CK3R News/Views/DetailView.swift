//
//  DetailView.swift
//  H4CK3R News
//
//  Created by Rohin Madhavan on 30/04/2024.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}



#Preview {
    DetailView(url: "https://www.google.com")
}
