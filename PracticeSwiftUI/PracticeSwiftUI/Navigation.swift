//
//  Navigation.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("detail page")
            } label: {
                Text("destnation")
            }.navigationTitle("navigation")
        }
        
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
