//
//  EasyModeView.swift
//  FluentyApp
//
//  Created by Marcelo de Abreu on 24/02/24.
//

import SwiftUI

struct EasyModeView: View {
    
    
    @ObservedObject var gameManagerVM: GameManagerVM
    
    var body: some View {
        
        Image("logoIdiomQuizApp5")
            .resizable()
            .scaledToFit()
            .frame(width: 250)
            .padding(50)
        
        ZStack {
            
            Spacer()
            
            if (gameManagerVM.model.quizCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                
                VStack {
                    
                    ReusableText(text: gameManagerVM.model.quizModel.question)
                            .font(.title2)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                    OptionsGridView(gameManagerVM: gameManagerVM)
                    
                }
            }
        }
    }
}

#Preview {
    EasyModeView(gameManagerVM: GameManagerVM())
}
