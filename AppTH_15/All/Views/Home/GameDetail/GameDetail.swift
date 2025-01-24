//
//  GameDetail.swift
//  AppTH_15
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct GameDetail: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedGame?.gName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.players.filter({($0.plGame ?? "") == viewModel.selectedGame?.gName ?? ""}).isEmpty {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Generate new player")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 16, weight: .regular))
  
                    } else {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.players.filter({($0.plGame ?? "") == viewModel.selectedGame?.gName ?? ""}), id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.plIm ?? "")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    Text(index.plName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedPlayer = index
                                        
                                        viewModel.plNewWin = String("\(Int((Int(viewModel.selectedPlayer?.plWin ?? "") ?? 0) - 1))")

                                        CoreDataStack.shared.updatePlayer(withPlName: viewModel.selectedPlayer?.plName ?? "", plNewWin: viewModel.plNewWin)
                                        
                                        viewModel.fetchPlayers()
                                        
                                    }, label: {
                                        
                                        Text("-")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                            .padding(9)
                                            .background(Circle().fill(.black))
                                    })
                                    
                                    Text(index.plWin ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedPlayer = index
                                        
                                        viewModel.plNewWin = String("\(Int((Int(viewModel.selectedPlayer?.plWin ?? "") ?? 0) + 1))")

                                        CoreDataStack.shared.updatePlayer(withPlName: viewModel.selectedPlayer?.plName ?? "", plNewWin: viewModel.plNewWin)
                                        
                                        viewModel.fetchPlayers()
                                        
                                    }, label: {
                                        
                                        Text("+")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                            .padding(9)
                                            .background(Circle().fill(.black))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            }
                        }
                          
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddPlayer = true
                    }
                    
                }, label: {
                    
                    Text("Generate")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: 230, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlayers()
        }
        .sheet(isPresented: $viewModel.isAddPlayer, content: {
            
            AddPlayer(viewModel: viewModel)
        })
    }
}

#Preview {
    GameDetail(viewModel: HomeViewModel())
}
