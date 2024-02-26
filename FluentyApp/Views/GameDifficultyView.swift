//
//  GameDifficultyView.swift
//  FluentyApp
//
//  Created by Marcelo de Abreu on 24/02/24.
//

import SwiftUI

struct GameDifficultyView: View {
    
    
    
    var body: some View {
        
        VStack {
            
            Image("logoIdiomQuizApp5")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(50)
            
            ReusableText(text: "Escolha o nível de dificuldade:")
                .font(.title2)
                .padding()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink(destination: EasyModeView(gameManagerVM: GameManagerVM())) {
                ReusableText(text: "Fácil")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            NavigationLink(destination: MediumModeView()) {
                ReusableText(text: "Médio (soon)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .opacity(0.8)
            }
            
            NavigationLink(destination: HardModeView()) {
                ReusableText(text: "Difícil (soon)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .opacity(0.8)
            }
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GameDifficultyView()
}
