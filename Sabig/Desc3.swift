//
//  amal.swift
//  mini2
//
//  Created by Amal Abughazaleh on 13/05/1445 AH.
//


import SwiftUI

struct Desc3: View {
    var body: some View {
        
        ZStack{
            
            AngularGradient( gradient: Gradient(colors:[CustomColor.CustomDpurple, CustomColor.CustomLpurple]),
                             center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
            
            .ignoresSafeArea()
            
            Color(.black)
                .blur(radius: 140)
                .opacity(0.3)
                .ignoresSafeArea()
           
            VStack(alignment: .trailing , spacing: 40) {
                    

                    
                    Text(" أسرع فريق يفك الشفرة و يجيب مفتاح يضغط على اسم التيم حقه عشان تحسب  له نقطه👏")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Text("خليكم مركزين و انتو تضغطون في حال ضغطتو على فريق الخصم مشكلتكم!  و راح تروح لهم النقطه 🤫")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Text("نهاية اللعبه بيتم عرض الفريق الفائز و على الفريق الخسران تنفيذ العقاب المعرض له 🫡")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                   Spacer()
            }.padding(.top,190)
            
        }
        
        
        
    }
    
}
    
#Preview {
    Desc3()
}
