//
//  ProfileView.swift
//  AppTH_15
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
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
                                
                                viewModel.isProfile = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                        })
                    }
                }
                .padding(.bottom, 50)

                    if viewModel.Photo.isEmpty {
                        
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                            .font(.system(size: 40, weight: .regular))
                            .frame(width: 130, height: 130)
                            .background(Circle().fill(.gray.opacity(0.2)))
                        
                    } else {
                        
                        Image(viewModel.Photo)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .frame(maxWidth: .infinity)
                            .frame(width: 130, height: 130)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    }
                
                if viewModel.Name.isEmpty {
                    
                    Text("User Name")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.bottom, 50)
                    
                } else {
                    
                    Text(viewModel.Name)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.bottom, 50)

                }
                
                HStack {
                    
                    Text("Games:")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("\(viewModel.numGames) /")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("Wins:")
                        .foregroundColor(Color("prim3"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("\(viewModel.numWins) /")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("Average score:")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("\(viewModel.numScore)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .regular))
                }
                
                Spacer()
                
                
                VStack(spacing: 17) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        Text("Rate the app")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 19).fill(.white.opacity(0.2)))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/b011e3be-c489-46bd-9fac-c08ec2f1f56f") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        Text("Privacy Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 19).fill(.white.opacity(0.2)))
                    })
                }
                                    
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isEditProfile, content: {
            
            EditProfile(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
