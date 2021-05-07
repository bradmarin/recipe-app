//
//  CachedImageView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation
import SwiftUI
import UIKit

let cache = NSCache<NSString, UIImage>()

struct CachedImageView: View {
    @ObservedObject var loader = ImageLoader()
    
    init(_ url: URL) {
        loader.loadImage(url)
    }
    
    var body: some View {
        AnyView(Image(uiImage: loader.image).resizable().renderingMode(.original).aspectRatio(contentMode: .fit))
    }
}

extension CachedImageView {
    class ImageLoader: ObservableObject {
        @Published var image: UIImage = UIImage()
        @Published var isLoading = false
        
        func loadImage(_ url: URL) {
            isLoading = true
            download(url) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let image):
                        self?.image = image
                    }
                }
            }
        }
        private func download(_ url: URL, completion: @escaping (Result<UIImage, Error>) -> ()) {
            if let image = cache.object(forKey: url.lastPathComponent as NSString) {
                return completion(.success(image))
            }
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    return completion(.failure(error))
                }
                guard let data = data else {
                    return completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }
                if let img = UIImage(data: data) {
                    cache.setObject(img, forKey: url.lastPathComponent as NSString)
                    completion(.success(img))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }
            }.resume()
        }
    }
}
