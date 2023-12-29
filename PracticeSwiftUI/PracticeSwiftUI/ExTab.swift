//
//  ExTab.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct ExTab: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            ExList().tabItem { Text("first") }.tag(1)
            Layout().tabItem { Text("layout") }.tag(2)
        }
    }
}

struct ExTab_Previews: PreviewProvider {
    static var previews: some View {
        ExTab()
    }
}
