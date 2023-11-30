//
//  GameRoom.swift
//  GameC
//
//  Created by Samaa on 28/11/2023.
//

import SwiftUI

struct GameRoom: View {
    @State private var showingAlert = false
    @State private var showCode = false
    @State private var showGotPoint = false
    @State private var CounterTeamOne = 0
    @State private var CounterTeamTwo = 0
    @State private var presnt : CGFloat = 003
    
    @Binding var team1Name : String
    @Binding var team2Name : String
    
    //ARRAY FOR THE GRID
    let clumns = Array(repeating: GridItem(.flexible(),spacing: 8), count:8)
    // Data model for the code grids
    let keyValueItems = [
        KeyValueItem(id: UUID(), key: 10, value: "ض"),
        KeyValueItem(id: UUID(), key: 8, value: "ط"),
        KeyValueItem(id: UUID(), key: 16, value: "ظ"),
        KeyValueItem(id: UUID(), key: 26, value: "ع"),
        KeyValueItem(id: UUID(), key: 17, value: "غ"),
        KeyValueItem(id: UUID(), key: 28, value: "ف"),
        KeyValueItem(id: UUID(), key: 27, value: "ق"),
        KeyValueItem(id: UUID(), key: 7, value:  "ك"),
        KeyValueItem(id: UUID(), key: 25, value: "ل"),
        KeyValueItem(id: UUID(), key: 22, value: "م"),
        KeyValueItem(id: UUID(), key: 12, value: "ن"),
        KeyValueItem(id: UUID(), key: 19, value: "ه(ة)"),
        KeyValueItem(id: UUID(), key: 14, value: "و"),
        KeyValueItem(id: UUID(), key: 21, value: "ي"),
        KeyValueItem(id: UUID(), key: 1, value: "ا(ء)"),
        KeyValueItem(id: UUID(), key: 24, value: "ب"),
        KeyValueItem(id: UUID(), key: 13, value: "ت"),
        KeyValueItem(id: UUID(), key: 11, value: "ث"),
        KeyValueItem(id: UUID(), key: 9, value: "ج"),
        KeyValueItem(id: UUID(), key: 5, value: "ح"),
        KeyValueItem(id: UUID(), key: 2, value: "خ"),
        KeyValueItem(id: UUID(), key: 6, value: "د"),
        KeyValueItem(id: UUID(), key: 4, value: "ذ"),
        KeyValueItem(id: UUID(), key: 20, value: "ر"),
        KeyValueItem(id: UUID(), key: 23, value: "ز"),
        KeyValueItem(id: UUID(), key: 18, value: "س"),
        KeyValueItem(id: UUID(), key: 3, value: "ش"),
        KeyValueItem(id: UUID(), key: 15, value: "ص"),
        
    ]

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
            VStack{
                HStack{
                    Button("إنهاء") {
                              showingAlert = true
                          }
                          .alert("هل تريد إنهاء اللعبة؟", isPresented: $showingAlert) {
                              Button("إلغاء",role: .cancel) { }
                              Button("إنهاء",role: .destructive) { }
                          }
                          .foregroundColor(CustomColor.CustomDyellow)
                          .font(.system(size: 24))
                          .padding(10)
                          
                    
                    Spacer()
                    
                    Button("دعوة") {
                        showCode = true
                          }
                          .alert("رمز الدعوة:", isPresented: $showCode) {
                              Button("نسخ",role: .cancel) { }
                          } message: {
                              Text("CBC1414")
                              
                          }
                          .foregroundColor(CustomColor.CustomDyellow)
                          .font(.system(size: 24))
                          .padding(10)
                    
                          
                }.padding(30)//END OF HSTACK FOR THE BTNS
                
          
                HStack{
                    VStack(alignment:.trailing){
                        Text("\(team1Name)")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        Text("\(CounterTeamOne)/100")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                        ZStack(alignment:.leading){
                            ZStack{
                                //let pct1 = Double(CounterTeamOne)/1
                                //Text(String(format: "%.0f", self.presnt * 100) + "%")
                                Capsule()
                                .fill(.black.opacity(0.08)).frame(width: 100,height: 22)}
                            let pct1 = Double(CounterTeamOne)/1;
                            Capsule()
                                .trim(from:0, to: pct1)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [ CustomColor.CustomLyellow,CustomColor.CustomDyellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(width:pct1, height: 18)
                        }
                     
                            //.padding(.top)
                    }.foregroundColor(.white)
                    Spacer()
      
                    VStack{
                        Text("سارع بفك الشفرة وتنفيذ الطلب")
                                     .foregroundColor(.white)
                                     .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                                     .fontWeight(.regular)
                                     .multilineTextAlignment(.trailing)
                        ZStack{
                        //THE SERIAL NUMBER FOR THE CODE
                       Text("7,28,4")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                                //.multilineTextAlignment(.trailing)
                                //.font(.system(family: "Helvetica"))
                            Capsule()
                                .fill(.white.opacity(0.08))
                                .frame(width: 290,height: 60)
                        }

                    }
               
                    
                    
                    Spacer()
                    VStack(alignment:.trailing){
                        Text(("\(team2Name)"))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        Text("\(CounterTeamTwo)/100")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                       
                        ZStack(alignment:.leading){
                            ZStack{
                                //Text(String(format: "%.0f", self.presnt * 100) + "%")
                                Capsule()
                                    .fill(.black.opacity(0.08))
                                    .frame(width: 100,height: 22)
                            }
                            let pct2 = Double(CounterTeamTwo)/1;
                            Capsule()
                                .trim(from:0, to: pct2)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [ CustomColor.CustomLyellow,CustomColor.CustomDyellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(width: pct2, height: 18)
                        }
                    }.foregroundColor(.white)
                       
                }.padding(30)
             
                //START OF THE CODE GRID...

                
                LazyVGrid(columns: clumns, spacing: 8) {
                    ForEach(keyValueItems) { item in
                        ZStack{
                            Rectangle()
                                .fill(.white.opacity(0.09)).frame(width: 70,height: 70)
                                .cornerRadius(13)
                        
                        HStack {
                            Text("\(item.key)")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                                
                        }

                        }
                        ZStack{
                            Rectangle()
                                .fill(.white.opacity(0.09)).frame(width: 70,height: 70)
                                .cornerRadius(13)
                            
                            HStack {
                                
                                Text("\(item.value)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                    }
                }.padding(30)
                
                
                
                //HSTACK FOR THE BTN COUNTER START ...
                HStack{
                    
                    
                    Button {
                        if CounterTeamOne + 10 <= 100 {
                            CounterTeamOne += 10
                        }
                        showGotPoint=true

                    } label: {
                        ZStack{
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ CustomColor.CustomLyellow,CustomColor.CustomDyellow]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 200, height: 220) .cornerRadius(13)
                            
                            VStack{
                                Text("\(team1Name)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                Image("Ninja_with_stick")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                    .offset(y:15)
                                
                            }
                        }
                    }
                    .alert("كفو والله!!", isPresented: $showGotPoint) {
                                        Button("كمل 💪",role: .cancel) { }
                                     }
                    Spacer()
                    
                    Button {
                        if CounterTeamTwo + 10 <= 100 {
                            
                            CounterTeamTwo += 10
                           
                            
                        }
                        
                        showGotPoint=true

                    }
                
                    
                
                label: {
                        
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ CustomColor.CustomLpurple,CustomColor.CustomDpurple]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 200, height: 220)
                                .cornerRadius(13)
//
                            VStack{
                                Text("\(team2Name)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                Image("NINJA_SMILE")
                                    .resizable()
                                    .frame(width: 145,height: 145)
                                    .offset(y:15)
                            }
                     
                }   }
                .alert("كفو والله!!", isPresented: $showGotPoint) {
                                    Button("كمل 💪",role: .cancel) { }
                                 }
                    
                    
                    
                    
                }.padding(30)
                //HSTACK FOR THE BTN COUNTER END ...
                
                    .navigationBarBackButtonHidden(true)
                
                
                
                
                
                
                
                
                
                
                
                
                
                 }// END OF VSTACK
            }
       
      
    }    }

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


struct KeyValueItem: Identifiable {
    let id: UUID
    let key: Int
    let value: String
}


#Preview {
    GameRoom(team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
}
