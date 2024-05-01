//  ContentView.swift
//  ThreeApp_SUI


import SwiftUI

struct ContentView: View {
    
    @State private var isPresentAlert = false
    @State private var isShowAlert = false
    @State private var isPresentSheet = false
    @State private var isShowSheet = false
    
    @State var secondAlertText = "Пример Alert с 2 \nкнопками и логикой"
    @State var secondSheetText = "Пример ActionSheet \nкнопками и логикой"
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Alert & ActionSheet")
                .lineLimit(1)
                .font(.custom("Inter-Bold", fixedSize: 20))
                .offset(y: -50)
            
            HStack {
                Text("Пример Alert")
                    .font(.custom("Inter-Bold", fixedSize: 14))
                Spacer()
                Button {
                    isPresentAlert = true
                } label: {
                    Text("Показать")
                }
                .frame(width: 150, height: 40)
                .shadow(radius: 8)
                .background(Color.purple)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .alert(isPresented: $isPresentAlert, content: {
                    Alert(title: Text("SwiftUI"), message: Text("RoadMap"), dismissButton: .default(Text("Ok")))
                })
            }
            
            HStack {
                Text(secondAlertText)
                    .font(.custom("Inter-Bold", fixedSize: 14))
                Spacer()
                Button(action: {
                    isShowAlert = true
                }) {
                    Text("Показать")
                }.alert(isPresented: $isShowAlert) {
                    Alert(title: Text("SwiftUI"), message: Text("Swift"), primaryButton: .default(Text("Сhange the text"), action: {
                        secondAlertText = "Новый текст"
                    }), secondaryButton: .cancel())
                }
                .frame(width: 150, height: 40)
                .background(Color.purple)
                .foregroundColor(Color.white)
                .shadow(radius: 8)
                .cornerRadius(10)
            }
            
            HStack {
                Text("Пример ActionSheet")
                    .font(.custom("Inter-Bold", fixedSize: 14))
                Spacer()
                Button(action: {
                    isPresentSheet = true
                }) {
                    Text("Показать")
                }.actionSheet(isPresented: $isPresentSheet) {
                    ActionSheet(title: Text("SwiftUI or UIKit?"), message: Text("Сделай выбор"), buttons: [.default(Text("SwiftUI")), .default(Text("UIKit"))])
                }
                .frame(width: 150, height: 40)
                .background(Color.purple)
                .foregroundColor(Color.white)
                .shadow(radius: 8)
                .cornerRadius(10)
            }
            
            HStack {
                Text(secondSheetText)
                    .font(.custom("Inter-Bold", fixedSize: 14))
                Spacer()
                Button(action:  {
                    isShowSheet = true
                }) {
                    Text("Показать")
                }.actionSheet(isPresented: $isShowSheet) {
                    ActionSheet(title: Text("SwiftUI or UIKit?"), message: Text("Сделай выбор"), buttons: [.default(Text("SwiftUI"), action: {
                        secondSheetText = "SwiftUI"
                    }), .default(Text("UIKit"), action: {
                        secondSheetText = "UIKit"
                    }), .destructive(Text("Delete"), action: {
                        secondSheetText = "Пример ActionSheet \nкнопками и логикой"
                    })])
                }
                .frame(width: 150, height: 40)
                .shadow(radius: 8)
                .background(Color.purple)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
        }
        .padding(.top, -300)
        .padding()
    }
}

#Preview {
    ContentView()
}
