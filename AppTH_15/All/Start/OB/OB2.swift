//
//  OB2.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI

struct OB2: View {

    @AppStorage("status") var status: Bool = false
    @Environment(\.presentationMode) var back
    
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
                
                Image("ob2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 12) {
                    
                    Text("Game Timer")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Track time and keep your sessions dynamic and fun.")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                        })
                        
                        NavigationLink(destination: {
                            
                            OB3()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                            
                        })
                    }
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
    OB2()
}
