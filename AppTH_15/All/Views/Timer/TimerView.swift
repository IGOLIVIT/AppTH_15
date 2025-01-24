//
//  TimerView.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Timer")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color("prim"), lineWidth: 8)
                            .frame(maxWidth: .infinity)
                            .padding(50)
                        
                        Text("\(formattedTime)")
                            .foregroundColor(Color.white)
                            .font(.system(size: 70, weight: .regular))
                        
                    }
                    
                    HStack {
                        
                        if !viewModel.isRunning || viewModel.remainingTime == 0 {
                            
                            Button(action: {
                                
                                viewModel.start()
                                
                            }, label: {
                                
                                Text("Start")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(Circle().fill(Color("prim2").opacity(0.3)))
                            })
                            
                        } else {
                            
                            Button(action: {
                                
                                viewModel.finish()
                                
                            }, label: {
                                
                                Text("Reset")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(Circle().fill(Color("prim2").opacity(0.3)))
                            })
                            .disabled(viewModel.remainingTime == 0)
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.stop()
                            
                        }, label: {
                            
                            Text("Stop")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Circle().fill(Color.gray.opacity(0.3)))
                        })
                        .disabled(!viewModel.isRunning)
                    }
                }
            }
            .padding()
        }
    }
    
    private var formattedTime: String {
        let minutes = viewModel.remainingTime / 60
        let seconds = viewModel.remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView()
}
