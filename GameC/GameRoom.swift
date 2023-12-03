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
    @State  var CounterTeamOne = 0
    @State  var CounterTeamTwo = 0
    @State private var presnt : CGFloat = 003
    
    @State private var navigationActive: Bool = false
    
    @State var lightweightObjects: [String] = [
        "كتاب",
        "لمبة",
        "ستارة",
        "ساعة حائط",
        "مصباح",
        "صحن",
        "مشغل موسيقى",
        "فنجان قهوة",
        "ملعقة",
        "شمعة",
        "مزهرية",
        "إطار صورة",
        "قلم رصاص",
        "كرة تنس",
        "سلة نفايات",
        "مرآة صغيرة",
        "منديل ورقي",
        "حلق",
        "كرة الشاطئ",
        "مظلة صغيرة",
        "محفظة",
        "ساعة معصم",
        "أقلام ملونة",
        "كاميرا فورية",
        "مشط",
        "صابون صغير",
        "كرسي مطوي",
        "مفكرة",
        "قميص خفيف",
        "هاتف جوال",
        "حقيبة صغيرة",
        "مفاتيح السيارة",
        "نظارات شمسية",
        "كرة طائرة",
        "سماعات أذن",
        "قنينة ماء",
        "لوحة فنية صغيرة",
        "قطعة أثاث من البامبو",
        "ورق تغليف هدايا",
        "سجادة صغيرة",
        "شمسية محمولة",
        "حقيبة ظهر صغيرة",
        "كرة تنس الطاولة",
        "نبات داخلي صغير",
    ]
    @State var UniqueSet  = Set <String> ()
    
    
    @Binding var team1Name : String
    @Binding var team2Name : String
    
    @State var sheetShowing = false
    //ARRAY FOR THE GRID
    let clumns = Array(repeating: GridItem(.flexible(),spacing: 8), count:8)
    // Data model for the code grids
    @State var keyValueItems = [
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
        
    ].shuffled()
    
    
    @State var Current_Q  = ""
    
    
    var body: some View {
        
        //  var Current_Q : String
      
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
                        //                        ZStack{
                        //                        //THE SERIAL NUMBER FOR THE CODE
                        //
                        //                            //lightweightObjects
                        //                           // var UniqueSet  = Set <String> ()
                        //                            //uniqueShaffled
                        ZStack{
                        //    let Current_Q = uniqueShaffled(Array1: &lightweightObjects,UniqueSet1: &UniqueSet)
                            //"\(team1Name)"
                            Text(Current_Q)
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
                        
                        Current_Q = uniqueShaffled(Array1: &lightweightObjects,UniqueSet1: &UniqueSet)
                        
                        ScoreFun(Current_Counter: &CounterTeamOne)
                        if (CounterTeamOne == 100){
                            sheetShowing.toggle()
                        }
                        
                        //                            let Current_Q = uniqueShaffled(Array1: &lightweightObjects,UniqueSet1: &UniqueSet)
                        
                        
                        // showGotPoint=true
                        
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
                                Image("ninja_with_stick")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                    .offset(y:15)
                                    .fullScreenCover(isPresented:$sheetShowing){
                                        Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)}
                                    }
                                
                            }
                        }
                  
//                    .alert("كفو والله!!", isPresented: $showGotPoint) {
//                        Button("كمل 💪",role: .cancel) { }
//                    }
                    Spacer()
                    
                    Button {
                        
                        Current_Q = uniqueShaffled(Array1: &lightweightObjects,UniqueSet1: &UniqueSet)
                        ScoreFun(Current_Counter: &CounterTeamTwo)
                        
                        showGotPoint=true
                        if (CounterTeamTwo == 100){
                            sheetShowing.toggle()
                        }
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
                                .fullScreenCover(isPresented:$sheetShowing){
                                    Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)}
                        }
                        
                    }   }
//                .alert("كفو والله!!", isPresented: $showGotPoint) {
//                    Button("كمل 💪",role: .cancel) { }
//                }
                    
                    
                    
                    
                }.padding(30)
                //HSTACK FOR THE BTN COUNTER END ...
                
                
                
                //                ZStack{
                //                    //THE SERIAL NUMBER FOR THE CODE
                //
                //                    //lightweightObjects
                //                    // var UniqueSet  = Set <String> ()
                //                    //uniqueShaffled
                //
                //                    let Current_Q = uniqueShaffled(Array1: &lightweightObjects,UniqueSet1: &UniqueSet)
                //                    //"\(team1Name)"
                //                    Text(Current_Q)
                //                        .foregroundColor(.white)
                //                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                //                        .fontWeight(.semibold)
                //                    //.multilineTextAlignment(.trailing)
                //                    //.font(.system(family: "Helvetica"))
                //                    Capsule()
                //                        .fill(.white.opacity(0.08))
                //                        .frame(width: 290,height: 60)
                //                }.offset( y: -960)
                //
                    .navigationBarBackButtonHidden(true)
                
                
                
                
            }// END OF VSTACK
        }
        
    }
    
    func uniqueShaffled(Array1: inout [String],UniqueSet1 : inout Set<String>)-> String {
        
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
        
        
    }}


func ScoreFun ( Current_Counter: inout Int){
    if Current_Counter + 10 <= 100 {
        
        Current_Counter += 10
    }
}
    
    
    struct KeyValueItem: Identifiable {
        let id: UUID
        let key: Int
        let value: String
    }

//func KeyShaffled(Array1: inout [KeyValueItem]){
//    Array1=Array1.shuffled()
//    return Array1
//}
    
    
    #Preview {
        GameRoom(team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
    }

