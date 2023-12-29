//
//  ModalContent.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct ModalContent: View {
    
    @Binding var showModal:Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button {
            showModal.toggle()
        } label: {
            Text("close")
        }

    }
}

struct ModalContent_Previews: PreviewProvider {
    static var previews: some View {
        ModalContent(showModal: .constant(true))
    }
}
