//
//  MainView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI

struct MainView: View {
   
    var body: some View {
        TabCurveView().preferredColorScheme(.light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
