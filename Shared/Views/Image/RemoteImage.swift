//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Jakub Gawecki on 24/02/2021.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(with: urlString) { [weak self] (uiImage) in
            guard let self = self else { return }
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async { self.image = Image(uiImage: uiImage) }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromUrlString: urlString)}
    }
}
