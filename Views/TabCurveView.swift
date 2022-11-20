//
//  TabView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI

struct TabCurveView: View {
    
    @State var currentTab = "house.fill"
    @State var curveAxis: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag("house.fill")
                GameView()
                    .tag("gamecontroller.fill")
                MapView()
                    .tag("map.fill")
                FeedView()
                    .tag("message.fill")
                
            }
            .clipShape(
                CustomTabCurve(curveAxis: curveAxis)
            ).padding(.bottom, -90)
            
            HStack(spacing: 0) {
                TabButtons()
            }.frame(height: 36).padding(.horizontal, 35)
        }
        .background(Color("Green"))
        .ignoresSafeArea(.container, edges: .top)
    }
    @ViewBuilder
    func TabButtons()-> some View{
        ForEach(["house.fill", "gamecontroller.fill", "map.fill", "message.fill"], id: \.self) { image in
            GeometryReader { proxy in
                Button(action: {
                    withAnimation {
                        currentTab = image
                        curveAxis = proxy.frame(in: .global).midX
                    }
                    
                    
                }, label: {
                    Image(systemName: image)
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .frame(width: 45, height: 45)
                        .background(
                            Circle().fill(Color("Green")))
                        .offset(y: currentTab == image ? -25 : 0)
                }).frame(maxWidth: .infinity, alignment: .center)
                    .onAppear(perform: {
                        if curveAxis == 0 && image == "house.fill" {
                            curveAxis = proxy.frame(in: .global).midX
                        }
                    })
            }
            .frame(height: 40)
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabCurveView()
    }
}

extension View{
    func getRect()->CGRect{
        UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
}
