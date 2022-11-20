//
//  GameView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 20/11/2022.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            
            Color(hex: 0xf4f3e8).ignoresSafeArea()
            VStack {
                Text("Hello").font(.custom("Lora-Bold", size: 30)).foregroundColor(Color(hex: 0x3E3E3E))
                ZStack{
                   
                    Image("Background").resizable().frame(height: 560).offset(y: -280)
                    GameFrameView().frame(maxWidth: 400,maxHeight: 680).cornerRadius(30) .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(hex: 0x3E3E3E), lineWidth: 8)
                    )
                }
                HStack {
                    Text("Dżdżownica").font(.custom("Lora-Bold", size: 34)).foregroundColor(Color(hex: 0x3E3E3E)).offset(y: -760)
                    Spacer()
                }.padding(.leading, 30)
               
            }
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
