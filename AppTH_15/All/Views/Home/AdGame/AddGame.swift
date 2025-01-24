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
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
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
                                
                                ForEach(viewModel.bgs, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curBg = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curBg.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 40, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 240)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                                    
                                } else {
                                    
                                    Image(viewModel.curBg)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 240)
                                }
                                
                            })
                            
                            VStack {
                                
                                Text("Enter game name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.gName.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.gName)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(.bottom)
                                
                                ForEach(viewModel.types, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curType = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(index == "Playing" ? Color("prim3") : index == "Completed" ? Color("prim2") : Color("prim"))
                                            .font(.system(size: 15, weight: .medium))
                                            .padding(6)
                                            .frame(width: 140)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(index == "Playing" ? Color("prim3").opacity(0.4) : index == "Completed" ? Color("prim2").opacity(0.4) : Color("prim").opacity(0.4)))
                                            .background(RoundedRectangle(cornerRadius: 20).stroke(.red.opacity(viewModel.curType == index ? 1 : 0), lineWidth: 2))
                                    })
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Description (optional)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.gDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 70)
                        
                        Button(action: {
                            
                            viewModel.gIm = viewModel.curBg
                            viewModel.gType = viewModel.curType
                            
                            viewModel.addGame()
                            
                            viewModel.curBg = ""
                            viewModel.gName = ""
                            viewModel.gDescr = ""
                            
                            viewModel.fetchGames()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Add game")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 230, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .opacity(viewModel.gName.isEmpty || viewModel.curBg.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.gName.isEmpty || viewModel.curBg.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddGame(viewModel: HomeViewModel())
}
