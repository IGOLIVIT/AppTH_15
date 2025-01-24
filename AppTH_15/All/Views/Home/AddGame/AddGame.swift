//
//  AddGame.swift
//  AppTH_15
//
//  Created by IGOR on 23/01/2025.
//

import SwiftUI

struct AddGame: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add new game")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })

                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsin)
            }
            .padding()
        }
    }
}

#Preview {
    AddGame(viewModel: HomeViewModel())
}
