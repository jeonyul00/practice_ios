//
//  List.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct ExList: View {
    var fruits:[String:Int] = ["apple":100, "banana":200, "cherry":300]
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(fruits.keys.sorted(), id: \.self) {key in
                    HStack{
                        Text(key)
                        Spacer()
                        Text(fruits[key]?.description ?? "")
                    }
                }
            }.navigationTitle("fruit list")
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ExList()
    }
}
