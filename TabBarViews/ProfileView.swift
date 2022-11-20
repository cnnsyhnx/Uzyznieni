//
//  Profile.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
               
                Image("Background").resizable().frame(height: 560).offset(y: -280)
                ScrollView(showsIndicators: false){
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                    {
                        HStack {
                            
                            Image("backbutton").resizable().frame(width: 40, height: 40).padding(.leading)
                            Spacer()
                        }
                    }
                    HStack {
                        Text("Edytuj profil").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Lora-Bold", size: 40)).padding(.leading, 20).padding(.top, 20)
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Image("Avatar").resizable().frame(width: 80, height: 80).padding(.trailing, 300)
                            VStack {
                                Text("Katarzyna Nowak").foregroundColor(Color(hex: 0x3E3E3E))
                                Text(verbatim: "k.nowak@example.com").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Lora-Light", size: 12))
                                
                            }
                            ZStack {
                                Circle().frame(width: 40, height: 40).foregroundColor(Color(hex: 0xE2EF3A))
                                Image("pencil2").resizable().frame(width: 28, height: 28)
                            }.offset(x:-112,y: 30)
                        }
                    }.padding(.bottom)
                    Image("group1").resizable().frame(width: 400, height: 300).padding(.bottom)
                    Image("group1").resizable().frame(width: 400, height: 300)
                }
               
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
