//
//  VideoDowonloader.swift
//  HelloConcurrency
//
//  Created by 전율 on 11/6/24.
//

import Foundation
import UIKit


enum DownloadError:Error {
    case error
}

class VideoDowonloader {
    
    let url = URL(string: "https://www.dl.dropboxusercontent.com/scl/fi/6u8taf686q6yxmobtdc5b/video.mp4?rlkey=wszd60y5fakvmx7lmedj4sv65&st=1816bqaj&dl=0")!
    let localUrl = URL(filePath: NSTemporaryDirectory().appending("video.mp4"))
    
    func download() throws -> URL {
        let data = try Data(contentsOf: url)
        try data.write(to: localUrl, options: .atomic)
        return localUrl
    }
    
    // GCD
    func download(completion: @escaping (Result<URL, Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: self.url)
                try data.write(to: self.localUrl, options: .atomic)
                DispatchQueue.main.async {
                    completion(.success(self.localUrl))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // concurreny
    func download() async throws -> URL {
        let (data, _) = try await URLSession.shared.data(from: url)
        try data.write(to: localUrl, options: .atomic)
        return localUrl
    }    
    
    
}
