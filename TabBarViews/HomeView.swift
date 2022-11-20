//
//  HomeView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView() {
            ZStack {
                
                Color(hex: 0xf4f3e8).ignoresSafeArea()
                Image("Background").resizable().frame(height: 560).offset(y: -280)
               
                VStack {
                    HStack {
                        Image("Avatar").resizable().frame(width: 64,height: 64)
                        Spacer()
                        NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                        {
                            Image("pencil2").resizable().frame(width: 30, height: 30)
                        }
                    }.padding(.trailing, 36).padding(.leading, 34)
                    
                    Text("Cześć, Katarzyna!").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Lora-Bold", size: 30)).padding(.trailing, 120).padding(.bottom, 1)
                    Text("Moje odznaki i nagrody").font(.custom("Lora-Bold", size: 20)).foregroundColor(Color(hex: 0x3E3E3E)).padding(.trailing, 130)
                    
                 
                    HStack {
                        ZStack {
                            Circle().frame(width: 48, height: 48).foregroundColor(Color(hex: 0xE2EF3A))
                            Image("gift").resizable().frame(width: 28, height: 28)
                        }
                        Spacer()
                    }.padding(.leading, 34)
                    
                    
                    
                    
                    
                   
                    
                    
                    Text("Moje wyzwania").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Lora-Bold", size: 20)).foregroundColor(Color(hex: 0x3E3E3E)).padding(.trailing, 200)
                    
                    
                    
                   
                        
                    
                    ZStack {
                        Image("HomeViewImage-2").resizable().frame(width: 368, height:226).padding(.bottom, 20)
                        Image("happysnake").resizable().frame(width: 100,height: 76).offset(y: -56)
                        Image("smallbutton").resizable().frame(width: 300, height: 60).offset(y: 40)
                       
                    }
                    
                    
                    
                    HStack{
                        VStack {
                            Text("Aktualności").font(.custom("Lora-Bold", size: 20)).padding(.trailing, 100).foregroundColor(Color(hex: 0x3E3E3E)).padding(.bottom, 5)
                            Text("Nowy kompostownik na mapie Krakowa!").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Poppins-Light", size: 18)).padding(.bottom, 20)
                            HStack(spacing: -148) {
                                Text("Więcej").foregroundColor(Color(hex: 0x3E3E3E)).padding(.trailing, 160).font(.custom("Lora-Bold", size: 16)).padding(.bottom, 5)
                                ZStack {
                                    
                                    Circle().frame(width: 20, height: 20).foregroundColor(Color(hex: 0xE2EF3A))
                                    Image("arrow").resizable().frame(width: 28,height: 28)
                                }
                                
                            }.padding(.trailing, 120)
                        }.padding(.leading)
                        Spacer()
                        Image("garden").resizable().frame(width: 157, height: 160)
                    }
                   
                    
                    
                }.padding(.bottom, 100)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
