//
//  FeedView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 20/11/2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                Color(hex: 0xf4f3e8).ignoresSafeArea()
                Image("Background").resizable().frame(height: 560).offset(y: -280)
                ScrollView(showsIndicators: false){
                    HStack(spacing: 18){
                        Image("search2").resizable().frame(width: 304, height: 48)
                        NavigationLink(destination: FeedProfileView().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                        {
                            Image("Avatar").resizable().frame(width: 50, height: 50)
                        }
                       
                       
                    }.padding(.bottom, 28).padding(.top, 46)
                    Image("feed12").resizable().frame(width: 400, height: 1200)
                }
            }
            
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
