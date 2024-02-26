//
//  HomeView.swift
//  FluentyApp
//
//  Created by Marcelo de Abreu on 24/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                            
                            Image("logoIdiomQuizApp5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250)
                                .padding(50)
                            
                            ReusableText(text: "Speak Native, Go Fluenty!")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                
                            
                            Spacer()
                            
                            ReusableText(text: "Um app para se tornar Fluenty!")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                
                            
                            NavigationLink(destination: GameDifficultyView()) {
                                ReusableText(text: "Começar")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 20)
                            }
                            .padding(.bottom, 30)
                        }
                        .padding()
                        .navigationBarHidden(true)
                    }
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                }
            }

#Preview {
    HomeView()
}

