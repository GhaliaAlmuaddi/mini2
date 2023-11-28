//
//  GameDescription.swift
//  mini2
//
//  Created by Amal Abughazaleh on 13/05/1445 AH.
//

import Foundation
import SwiftUI


struct GameDescription: View {
    var body: some View {
        
        TabView(){
            Desc1()
            Desc2()
            Desc3()
 }
        //.tabViewStyle(PageTabViewStyle())
       //.tabViewStyle(.page)
        .ignoresSafeArea()
        }
       
    }
        #Preview {
            GameDescription()
        }
