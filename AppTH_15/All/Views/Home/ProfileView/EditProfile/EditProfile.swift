//
//  EditProfile.swift
//  AppTH_15
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct EditProfile: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("User settings")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditProfile = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 50)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
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
                                .frame(width: 130, height: 130)
                                .background(Circle().fill(.gray.opacity(0.2)))
                            
                        } else {
                            
                            Image(viewModel.currentImPlayer)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .frame(maxWidth: .infinity)
                                .frame(width: 130, height: 130)
                                .background(Circle().fill(.gray.opacity(0.2)))
                        }
                        
                    })
                    
                    Text("Enter Name")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    Text("Enter number of games")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addNG.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNG)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    Text("Enter nuber of wins")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addNW.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNW)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    Text("Enter average score")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addNS.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNS)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom, 50)
                    
                    Button(action: {
                        
                        viewModel.Photo = viewModel.currentImPlayer
                        viewModel.Name = viewModel.addName
                        viewModel.numGames = viewModel.addNG
                        viewModel.numWins = viewModel.addNW
                        viewModel.numScore = viewModel.addNS
                        
                        viewModel.currentImPlayer = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditProfile = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 230, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    EditProfile(viewModel: HomeViewModel())
}
