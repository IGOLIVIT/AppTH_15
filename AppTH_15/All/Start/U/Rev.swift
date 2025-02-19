//
//  Rev.swift
//  AppTH_15
//
//  Created by IGOR on 17/02/2025.
//

import SwiftUI
import StoreKit

struct Rev: View {

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
                
                Image("ob3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 12) {
                    
                    Text("Rate our App!")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Rate our app in the AppStore. Help us to become better.")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                        Button(action: {

                            status = true
                            
                        }, label: {
                            
                            Text("Get started")
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Rev()
}
