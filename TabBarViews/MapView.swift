//
//  MapView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.049683, longitude: 19.944544), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

                                                                                  
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xf4f3e8).ignoresSafeArea()
                Image("Background").resizable().frame(height: 560).offset(y: -280)
                VStack {
                    HStack {
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true).navigationBarHidden(true))
                        {
                            Image("backbutton").resizable().frame(width: 40, height: 40).padding(.leading)
                            Spacer()
                            
                        }
                    }
                    HStack {
                       
                        Text("Mapa").foregroundColor(Color(hex: 0x3E3E3E)).font(.custom("Lora-Bold", size: 40)).padding(.leading, 20)
                        Spacer()
                    }
                    
                    ZStack {
                        
                        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .frame(width: 400, height: 600).cornerRadius(30).padding(.bottom, 60)
                        Image("Search").resizable().frame(width: 360, height: 50).offset(y: -280)
                        Image("rectangle").resizable().frame(width: 380, height: 140).offset(y: 180)
                        Image("model").resizable().frame(width: 360, height: 120).offset(y: 180)

                       
                    }
                }
              
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
