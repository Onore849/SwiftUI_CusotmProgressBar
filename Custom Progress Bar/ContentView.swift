//
//  ContentView.swift
//  Custom Progress Bar
//
//  Created by 野澤拓己 on 2020/10/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent : CGFloat = 0
    
    var body: some View {
        
        VStack {
            
            CustomProgressView(percent: self.$percent)
            
        }.padding()
        .onTapGesture {
            self.percent = 0.20
        }
        .animation(.spring())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomProgressView : View {
    
    @Binding var percent : CGFloat
    
    var body : some View {
        
        ZStack(alignment: .leading) {
            
            ZStack(alignment: .leading) {
                
                ZStack {
                    
                    Text(String(format: "%.0f", self.percent * 100) + "%").font(.caption).foregroundColor(Color.gray.opacity(0.75)).padding(.trailing)
                    
                    
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 22)
                    
                }
                
                Capsule()
                    .fill(LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: self.calPercent(), height: 22)
                
                
            }
            
        }
        .padding(18)
        .background(Color.black.opacity(0.085))
        .cornerRadius(15)
        
    }
    
    func calPercent() -> CGFloat {
        
        let width = UIScreen.main.bounds.width - 66
        
        return width * self.percent
        
    }
}
