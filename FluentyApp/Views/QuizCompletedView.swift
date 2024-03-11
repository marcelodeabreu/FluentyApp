//
//  QuizCompletedView.swift
//  FluentyApp
//
//  Created by Marcelo de Abreu on 25/02/24.
//

import SwiftUI

struct QuizCompletedView: View {
    
    @ObservedObject var gameManagerVM: GameManagerVM
    
    var body: some View {
        VStack {
            
            Text("GAME COMPLETED")
                .font(.title2)
            
            Button {
                            gameManagerVM.restartGame()
                        } label: {
                            HStack {
                                Text("Jogar Novamente")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                            }
                        }.frame(width: 300, height: 60, alignment: .center)
                            .background(.green.opacity(0.7))
                            .cornerRadius(30)
                            .padding()
                        
                    
            
        }
    }
}

#Preview {
    QuizCompletedView(gameManagerVM: GameManagerVM())
}
