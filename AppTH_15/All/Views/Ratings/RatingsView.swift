//
//  RatingsView.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI

struct RatingsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rating")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.players.isEmpty {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Generate new player")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 16, weight: .regular))
                        
                    } else {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.players, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.plIm ?? "")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading, 30)
                                    
                                    Spacer()
                                    
                                    Text(index.plName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 19, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image("goldstar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlayers()
        }
    }
}

#Preview {
    RatingsView(viewModel: HomeViewModel())
}
