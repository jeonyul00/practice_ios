//
//  Modal.swift
//  PracticeSwiftUI
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct Modal: View {
    @State var showModal:Bool = false // 바인딩 된 값이 사라지면 다시 초기화 되는건가
    var body: some View {
        VStack{
            Text("mail page")
            Button {
                showModal.toggle()
            } label: {
                Text("go to page")
            }
        }.sheet(isPresented: $showModal) {
            ModalContent(showModal: $showModal)
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
    }
}
