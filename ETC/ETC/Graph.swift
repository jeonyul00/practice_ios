//
//  Graph.swift
//  ETC
//
//  Created by 전율 on 10/19/24.
//

import Foundation

public struct Vertex<T: Equatable & Hashable>: Equatable {
    var data: T
    var index: Int
}

extension Vertex: Hashable {
    // hash(into:) 메서드 구현
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(index)
    }
}
