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
            
        }
    }
}

#Preview {
    QuizCompletedView(gameManagerVM: GameManagerVM())
}
