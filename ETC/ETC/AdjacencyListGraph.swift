//
//  AdjacencyListGraph.swift
//  ETC
//
//  Created by 전율 on 10/19/24.
//

import Foundation

public struct AdjacencyListGraph<T: Equatable & Hashable> {
    public var adjacenctLists: [VertexEdgeList<T>] = []
    
    public var vertices: [Vertex<T>] {
        get {
            var vertices = [Vertex<T>]()
            for list in adjacenctLists {
                vertices.append(list.vertex)
            }
            return vertices
        }
    }
    
    public var edges: [Edge<T>] {
        get {
            var edges = Set<Edge<T>>()
            for list in adjacenctLists {
                for edge in list.edges {
                    edges.insert(edge) // Set에 모서리 추가
                }
            }
            return Array(edges) // Set을 배열로 변환
        }
    }
    
    init() { }
}
