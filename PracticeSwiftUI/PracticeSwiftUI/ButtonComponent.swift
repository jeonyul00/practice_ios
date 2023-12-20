//
//  ButtonComponent.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct ButtonComponent: View {
    var title:String
    var color:Color
    
    var body: some View {
        Button {
            return
        } label: {
            Text(title).padding().background(color).foregroundColor(.white).cornerRadius(10)
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "프리뷰", color: .blue)
    }
}
