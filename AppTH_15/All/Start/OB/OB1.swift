//
//  OB1.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI

struct OB1: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
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
                
                Image("ob1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 12) {
                    
                    Text("Add your games")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Track scores and save your game history effortlessly.")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OB2()
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
    OB1()
}
