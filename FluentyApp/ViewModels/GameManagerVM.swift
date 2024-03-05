//
//  GameManagerVM.swift
//  FluentyApp
//
//  Created by Marcelo de Abreu on 24/02/24.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameMode(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i], quizCompleted: false)
    }
    
    @Published var model = GameManagerVM.createGameMode(i: GameManagerVM.currentIndex)
    @Published var progress = 0
    
    init() {
            self.start()
        }
    
    func start () {
        self.progress = 0
        GameManagerVM.currentIndex = 0
        
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
            for index in model.quizModel.optionsList.indices {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = false
            }
            if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId }) {
                if selectedOption.optionId == model.quizModel.answer {
                    model.quizModel.optionsList[index].isMatched = true
                    model.quizModel.optionsList[index].isSelected = true
                    
//                    GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if (GameManagerVM.currentIndex < 4) {
                            GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                            self.model = GameManagerVM.createGameMode(i: GameManagerVM.currentIndex)
                            self.progress += 1
                        } else {
                            self.model.quizCompleted = true
                            self.model.quizWinningStatus = true
                            self.progress += 1
                        }
                    }
                } else {
//                    GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                    
                    model.quizModel.optionsList[index].isMatched = false
                    model.quizModel.optionsList[index].isSelected = true
                    self.progress += 1
                }
            }
        }
    
    func restartGame() {
        
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameMode(i: GameManagerVM.currentIndex)
        self.start()
    }
}

extension GameManagerVM {
    
    static var quizData: [QuizModel] {
        
        [
            
            QuizModel(question: "Break the ice",
                      answer: "Quebrar o gelo",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "Ficar em casa", color: Color.green),
                                    QuizOption(id: 12, optionId: "B", option: "Comer sorvete", color: Color.green),
                                    QuizOption(id: 13, optionId: "C", option: "Andar no sol", color: Color.green),
                                    QuizOption(id: 14, optionId: "D", option: "Quebrar o gelo", color: Color.green)]),
            
            QuizModel(question: "In the same boat",
                      answer: "Na mesma situação",
                      optionsList: [QuizOption(id: 21, optionId: "A", option: "Consertar algo.", color: Color.green),
                                    QuizOption(id: 22, optionId: "B", option: "Na mesma situação", color: Color.green),
                                    QuizOption(id: 23, optionId: "C", option: "Caminhar sozinho.", color: Color.green),
                                    QuizOption(id: 24, optionId: "D", option: "Andar com rapidez.", color: Color.green)]),
            
            QuizModel(question: "Throw in the towel",
                      answer: "Desistir",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Desistir", color: Color.green),
                                    QuizOption(id: 32, optionId: "B", option: "Jogar sem saber", color: Color.green),
                                    QuizOption(id: 33, optionId: "C", option: "Entrar no banheiro", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Sonhar acordado", color: Color.green)]),
            
            QuizModel(question: "Take your time",
                      answer: "Sem pressa",
                      optionsList: [QuizOption(id: 41, optionId: "A", option: "Perguntar as horas", color: Color.green),
                                    QuizOption(id: 42, optionId: "B", option: "Sem pressa", color: Color.green),
                                    QuizOption(id: 43, optionId: "C", option: "Pegar o controle", color: Color.green),
                                    QuizOption(id: 44, optionId: "D", option: "Subir a escada", color: Color.green)]),
            
            QuizModel(question: "A picture is worth 1000 words",
                      answer: "Uma imagem vale mil palavras",
                      optionsList: [QuizOption(id: 51, optionId: "A", option: "Tirar uma fotografia", color: Color.green),
                                    QuizOption(id: 52, optionId: "B", option: "Ler um livro de mil páginas", color: Color.green),
                                    QuizOption(id: 53, optionId: "C", option: "Uma imagem vale mil palavras", color: Color.green),
                                    QuizOption(id: 54, optionId: "D", option: "Valer a pena o esforço", color: Color.green)])
            
        ]
        
    }
    
}
