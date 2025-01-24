//
//  HomeView.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("BoardMate")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "person.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                        })
                    }
                }
                .padding(.bottom, 30)
                
                if viewModel.games.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        
                        Text("You haven't added a game yet. Click 'Add Game' at the bottom of the screen.")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                            .frame(width: 290)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.games, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedGame = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(index.gIm ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(25)
                                        .overlay(
                                        
                                            VStack {
                                                
                                                Text(index.gType ?? "")
                                                    .foregroundColor(index.gType ?? "" == "Playing" ? Color("prim3") : index.gType ?? "" == "Completed" ? Color("prim2") : Color("prim"))
                                                    .font(.system(size: 13, weight: .medium))
                                                    .padding(6)
                                                    .frame(width: 110)
                                                    .background(RoundedRectangle(cornerRadius: 20).fill(index.gType ?? "" == "Playing" ? Color("prim3").opacity(0.3) : index.gType ?? "" == "Completed" ? Color("prim2").opacity(0.3) : Color("prim").opacity(0.3)))
                                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text(index.gName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 26, weight: .bold))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Spacer()
                                                
                                                Text("Board game")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text(index.gName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                                .padding()
                                        )
                                })
                            }
                        })
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add game")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: 230, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchGames()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddGame(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            GameDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            ProfileView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
