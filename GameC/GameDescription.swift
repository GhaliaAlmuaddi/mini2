//
//  GameDescription.swift
//  mini2
//
//  Created by Amal Abughazaleh on 13/05/1445 AH.
//

import Foundation
import SwiftUI


struct GameDescription: View {
    
    @Binding var sheetShowing : Bool
    var body: some View {
        
    
            
            
            ZStack{
                TabView(){
                    Desc1()
                    Desc2()
                    Desc3()
                } .ignoresSafeArea()
                //.toolbarBackground(.hidden, for: .navigationBar)
                // .navigationBarBackButtonHidden(true)
                //.toolbar {
                    .tabViewStyle(.page)
                // 2
                VStack {
                           
                            
                            HStack {
                                Spacer()
                                
                Button {
                    // 3
                    sheetShowing.toggle()
                    
                } label: {
                    // 4
                    
                    
                    Image(systemName: "xmark")
                        .resizable().scaledToFit()
                        .frame(width: 40, height: 40)
                        .font(.caption)
                    
                        .foregroundColor(.white)
                    
                    
                }  }
                    Spacer()
                      
                    
                }
                .padding()
             
            }
            //.toolbarBackground(.hidden, for: .navigationBar)
            //.tabViewStyle(PageTabViewStyle())
            
            
    
        
    }}
        #Preview {
            GameDescription(sheetShowing: .constant(true))
        }
