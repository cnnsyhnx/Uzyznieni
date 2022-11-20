//
//  FeedProfileView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 20/11/2022.
//

import SwiftUI

struct FeedProfileView: View {
    var body: some View {
        ZStack{
            
            Color(hex: 0xf4f3e8).ignoresSafeArea()
            ScrollView{
                HStack{
                    
                    Image("Avatar").resizable().frame(width: 90, height: 90).padding(.top, 38)
                    Image("badge2").resizable().frame(width: 40, height: 40).offset(x: -40, y: 44)
                   
                        
                    VStack {
                        Text("Katarzyna Nowak").padding(.trailing, 80).font(.custom("Lora-Bold", size: 20))
                        Text("@KatarzynaNowak").font(.custom("Poppins-Light", size: 14)).padding(.trailing, 118)
                    }.offset(x: -24, y: 28)
                    
                    
                }.padding(.leading, 34).padding(.bottom, 16)
                HStack {
                    Text("Twoi znjomi: 18").padding(.leading, 38).font(.custom("Poppins-Light", size: 18))
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    Image("people").resizable().frame(width: 390, height: 58)
                }.offset(x: 20)
                    
                Text("Twoje zdjęcia").offset(x: -120, y: 14).font(.custom("Poppins-Light", size: 18)).padding(.bottom, 20)
                HStack(spacing: 12){
                    NavigationLink(destination: CoffePost().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        Image("coffe").resizable().frame(width: 190, height: 190)
                    }
                    NavigationLink(destination: TeaPost().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        Image("tea").resizable().frame(width: 180, height: 180)
                    }
                }
                HStack(spacing: 12){
                    NavigationLink(destination: FruitPost().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        Image("fruit").resizable().frame(width: 190, height: 190)
                    }
                    NavigationLink(destination: PlantPost().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        Image("plant").resizable().frame(width: 190, height: 190)
                    }
                }
                Image("button2").resizable().frame(width: 400, height: 60)
            }
        }
    }
}

struct FeedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FeedProfileView()
    }
}
