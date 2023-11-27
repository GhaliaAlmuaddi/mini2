//
//  ContentView.swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 10/05/1445 AH.
//

import SwiftUI

   
struct ContentView: View {
    @State var isActive: Bool = false
    var body: some View {
        
        ZStack {
                    //BACKGROUND START...
                    AngularGradient(
                        gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
                        startAngle: .zero,
                        endAngle: .degrees(100)
                        
                    )
                    .ignoresSafeArea()
                    //BACKGROUND END...
            VStack {
                Button {
                    isActive = true
                } label: {
                    Text("يلا نلعب")
                }
            }
            .padding(30)

            if isActive {
                CreatingTeamDialogue(isActive: $isActive, title: "كون فريقك", buttonTitle: "يلا نبدا") {
                   // print("Pass to viewModel")
                }
            }
        }

//        NavigationStack {
//            
//           VStack {
//               NavigationLink(destination: {
//                   //PopupView()
//               }{
//                   
//                   Circle().fill(Color.orange).frame(width: 100, height: 100, alignment: .center)}
//                    
//                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/ ){
//                        Circle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100, alignment: .center)
//                    })
//                    
//                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/ ) {
//                        Circle().fill(Color.pink).frame(width: 100, height: 100, alignment: .center)
//                    }
//           }.navigationTitle("home page").padding()
//            }
        }
    }
// CUSTOM COLORS START...
struct CustomColor {
    static let CustomDpurple = Color("CustomDpurple")
    static let CustomDyellow = Color("CustomDyellow")
    static let CustomLpurple = Color("CustomLpurple")
    static let CustomLyellow = Color("CustomLyellow")
    
}

// CUSTOM COLORS END..
#Preview {
    ContentView()
}
