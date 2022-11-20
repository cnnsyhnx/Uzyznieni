//
//  FruitPost.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 20/11/2022.
//

import SwiftUI

struct FruitPost: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(hex: 0xf4f3e8).ignoresSafeArea()
                ScrollView {
                    NavigationLink(destination: FeedProfileView().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        Image("backbutton").resizable().frame(width: 40, height: 40).padding(.trailing, 320).padding(.bottom, 40).padding(.top, 10)
                    }
                    HStack {
                        Image("Avatar").resizable().frame(width: 90, height: 90)
                        Text("@KatarzynaNowak").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Poppins-Light", size: 18))
                        Spacer()
                    }.padding(.leading)
                    Image("fruit").resizable().frame(width: 400, height: 400).padding(.bottom)
                    Image("anothergroup").resizable().frame(width: 370, height: 70)
                }
            }
        }
    }
}

struct FruitPost_Previews: PreviewProvider {
    static var previews: some View {
        FruitPost()
    }
}
