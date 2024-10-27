//
//  AdjacencyList.swift
//  ETC
//
//  Created by 전율 on 10/19/24.
//

import Foundation

public struct VertexEdgeList<T: Equatable & Hashable> {
    public let vertex: Vertex<T>
    public var edges: [Edge<T>] = []

    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }

    public mutating func addEdge(edge: Edge<T>) {
        // 중복된 모서리 확인
        if self.edges.count > 0 {
            let equalEdges = self.edges.filter { existingEdge in return existingEdge == edge }
            if equalEdges.count > 0 { return }
        }
        // 새로운 모서리 추가
        self.edges.append(edge)
    }
}
