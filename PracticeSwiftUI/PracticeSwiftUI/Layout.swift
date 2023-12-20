//
//  Layout.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil").resizable().scaledToFit().frame(width:200, height:200)
            Text("Text Element 1").bold().padding(.top)
            Text("Text Element 2").padding(.top)
            Text("Text Element 3").padding(.top)
            HStack{
                ButtonComponent(title: "Button 1", color: .blue)
                ButtonComponent(title: "Button 2", color: .green)
            }
            Button {
                return
            } label: {
                VStack{
                    Image(systemName: "arrow.right.circle.fill").resizable().scaledToFit().frame(width: 50)
                    Text("Complex Button")
                }.foregroundColor(.white).padding().background(.orange).cornerRadius(10)
            }

        }
    }
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Layout()
    }
}
