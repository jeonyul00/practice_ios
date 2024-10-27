//
//  Edge.swift
//  ETC
//
//  Created by 전율 on 10/19/24.
//

import Foundation

public struct Edge<T: Equatable & Hashable>: Equatable {
    let from: Vertex<T>
    let to: Vertex<T>
}

extension Edge: Hashable {
    // hash(into:) 필수 메서드 구현
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from.index)
        hasher.combine(to.index)
    }
}
