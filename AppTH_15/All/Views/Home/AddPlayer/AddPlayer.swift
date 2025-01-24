//
//  AddPlayer.swift
//  AppTH_15
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct AddPlayer: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add new player")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlayer = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)

                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.imPlayers, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImPlayer = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentImPlayer.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 40, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 240)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                                    
                                } else {
                                    
                                    Image(viewModel.currentImPlayer)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 240)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                                }
                                
                            })
                            
                            VStack {
                                
                                Text("Enter player name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.plName.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plName)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(.bottom)

                                Text("Number of wins")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.plWin.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plWin)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(.bottom)
                            }
                        }
                            .padding(.bottom, 70)
                        
                        Button(action: {
                            
                            viewModel.plGame = viewModel.selectedGame?.gName ?? ""
                            viewModel.plIm = viewModel.currentImPlayer
                            
                            viewModel.addPlayer()
                            
                            viewModel.plName = ""
                            viewModel.plWin = ""
                            viewModel.currentImPlayer = ""
                            
                            viewModel.fetchPlayers()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlayer = false
                            }
                            
                        }, label: {
                            
                            Text("Generate")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 230, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPlayer(viewModel: HomeViewModel())
}
