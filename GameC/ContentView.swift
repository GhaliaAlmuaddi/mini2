//
//  ContentView.swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 10/05/1445 AH.
//

import SwiftUI

   
struct ContentView: View {
    //@State var isActive: Bool = false
    var objectCripto : [String]=["a","b","c","E","F","G","H","I","J","K"]
    var UniqueSet  = Set <String> ()
    
   // var res : String
    var body: some View {
        Text("G")
//        if let UnElement = uniqueShaffled( Array1: &objectCripto , UniqueSet1: &UniqueSet )
//        
//        Text("\(UnElement)")
        
      //  var objectCripto_shaffle = Array_shaffle(array1: objectCripto)
         
     //   objectCripto.shuffle()
        
//        var indx=3
//            var res = Array_shaffle2(array1: objectCripto,indexP: indx)
//                  Text("\(res)")
        
       // uniqueShaffled()
        
//        ForEach(objectCripto,id: \.self){ element in
//          Text("\(element)")
//          }
//            var indx=3
//            var res = Array_shaffle2(array1: objectCripto,indexP: indx)
//            Text("\(res)").background(.black)
         
       //  print("Pass to viewModel")
        
//        ZStack {
//                    //BACKGROUND START...
////                    AngularGradient(
////                        gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
////                        startAngle: .zero,
////                        endAngle: .degrees(100)
////                        
////                    )
////                    .ignoresSafeArea()
//                    //BACKGROUND END...
//            VStack {
//                Button {
//                    isActive = true
//                } label: {
//                    Text("يلا نلعب")
//                }
//            }
//            .padding(30)
//
//            if isActive {
//                CreatingTeamDialogue(isActive: $isActive, title: "كون فريقك", buttonTitle: "يلا نبدا") {
//                   // print("Pass to viewModel")
//                }
//            }
//        }.ignoresSafeArea()

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


//        func Array_shaffle (array1:[String])-> [String] {
//          var array1=array1.shuffled()
//            return array1
//        }
//
//       func Array_shaffle2 (array1:[String], indexP : Int)-> String {
//          var array1=array1.shuffled()
//          var index2=0
//            var value = ""
//           for i in array1 {
//                if(index2 == indexP){
//                 value = i
//                  break
//                }
//               index2=index2+1
//            }
//return value
//       }

func uniqueShaffled(Array1: inout [String],UniqueSet1 : inout Set<String>)-> String? {
    
    while true {
       Array1 = Array1.shuffled()
        
        for i in Array1 {
            if !UniqueSet1.contains(i) {
                UniqueSet1.insert(i)
                return i
            }
        }
        
        UniqueSet1.removeAll()
        
    }
    
    
}



// CUSTOM COLORS END..
#Preview {
    ContentView()
}
