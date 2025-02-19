//
//  U1.swift
//  AppTH_15
//
//  Created by IGOR on 12/02/2025.
//

import SwiftUI

struct U1: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            
            Image("u1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 17, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()

                VStack(spacing: 12) {
                    
                    Text("Achieve Greatness!")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Your journey to success starts here. Play, win, and enjoy every moment!")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Rev()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                        
                    })
                    .padding(.horizontal, 50)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 230)
            }
        }
    }
}

#Preview {
    U1()
}
