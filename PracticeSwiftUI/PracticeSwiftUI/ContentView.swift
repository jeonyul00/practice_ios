//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "pencil").resizable().scaledToFit().frame(width: 200, height: 200)
            Text("헤드라인 입니다.").font(.headline).bold().padding()
            Text("서브 헤드라인 입니다.").font(.headline).padding()
            Text("바디입니다.").font(.body).padding()
            Button {
                return
            } label: {
                Text("Clik Me").padding().background(.blue).foregroundColor(.white).cornerRadius(10).bold()
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
        ContentView()
    }
}

