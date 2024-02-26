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
            
            Image("logoIdiomQuizApp5")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(10)
            
            Text("GAME COMPLETED")
            
        }
    }
}

#Preview {
    QuizCompletedView(gameManagerVM: GameManagerVM())
}
