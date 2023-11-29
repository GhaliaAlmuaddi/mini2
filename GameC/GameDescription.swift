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
 } .ignoresSafeArea()
        //.toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            // 2
            ToolbarItem(placement: .navigationBarTrailing) {
                
                NavigationLink {
                    // 3
                HomePage()
                    
                } label: {
                    // 4
                   
                        
                        Image(systemName: "xmark")
                        .resizable().font(.largeTitle)
                        .foregroundColor(.white)
                        
                    
                }
             
            }}
        .toolbarBackground(.hidden, for: .navigationBar)
        //.tabViewStyle(PageTabViewStyle())
      .tabViewStyle(.page)
      
        }
       
    }
        #Preview {
            GameDescription()
        }
