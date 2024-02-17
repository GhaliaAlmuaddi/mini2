//
//  amal.swift
//  mini2
//
//  Created by Amal Abughazaleh on 13/05/1445 AH.
//


import SwiftUI

struct Desc1: View {
    var body: some View {
        
        ZStack{
            
            AngularGradient( gradient: Gradient(colors:[CustomColor.CustomDpurple, CustomColor.CustomLpurple]),
                             center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
            
            .ignoresSafeArea()
            
            Color(.black)
                .blur(radius: 140)
                .opacity(0.3)
                .ignoresSafeArea()
           
                VStack(alignment: .trailing , spacing: 20) {
                    
                    Text(" وش السالفة؟  🤔")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 50)
                        .padding(.top, 150.0)
                    Text("بالبداية ضروري تتجمعون على الجهاز و تنقسمون لفريقين.")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
//                    Text("شوفو عددكم اذا قليل يمديكم تلعبون بجهاز واحد. و اذا كنتم اكثر من ٤ اشخاص ننصحكم تدخلون على نفس التحدي من جهاز ثاني عن طريق مشاركه كود الانضمام للعبة بين الجهازين .")
//
//                        .font(.title)
//                        .foregroundColor(Color.white)
//                        .multilineTextAlignment(.trailing)
//                        .padding([.top, .leading, .trailing], 50.0)
//                        .padding(.bottom , -10)
                    Text(" بتبدأ اللعبة بعرض رقم شفرة، لازم التركيز يكون عندكم عالي!\n خليكم مصحصحين و شاربين قهوة و ضروري يكون عندكم\n لياقة للحركة 😎")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Text(" روحو الصفحة الثانية للتفاصيل.")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Spacer()
                }.padding(.top,140)
            
        }
        
        
        
    }
    
}
    
#Preview {
    Desc1()
}
