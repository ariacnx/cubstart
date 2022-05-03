//
//  LandingPageView.swift
//  HoldingPaws
//
//  Created by Aria Chen on 2022/4/24.
//

import Foundation
import SwiftUI

struct LandingPageView: View {
    
    @State var isActive:Bool = false
    let skyblue = Color(red: 137.0/255.0, green: 213.0/255.0, blue: 255.0/255.0, opacity: 1.0)
    
        var body: some View {
            VStack {
                
                if self.isActive {
                    
                    ContentView()
                } else {
                    
                    Text("HoldingPaws")
                        .font(Font.largeTitle)
                        .bold()
                        .foregroundColor(skyblue)
                    Logo()
//                        .background(
//                            Image("background")
//                            .resizable()
//
//                            .scaledToFill())
//
                        
                            //.aspectRatio(contentMode: .fill))
                }
                   
            }
            
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    
    struct Logo : View {
        var body: some View {
            return Image("paw")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 75)
        }
    }

}
