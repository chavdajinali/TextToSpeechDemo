//
//  Quiz.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

// Model for a single question
struct Question: Identifiable {
    let id = UUID()
    var text: String
    var options: [String]
    var correctAnswer: Int
}

// Model for the quiz
struct Quiz {
    var questions: [Question]
    var currentQuestionIndex: Int = 0
    var score: Int = 0
}

// Shared instance of the quiz
class QuizShared: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "What is the capital of France?", options: ["Paris", "London", "Berlin", "Rome"], correctAnswer: 0),
        Question(text: "What is the largest planet in our solar system?", options: ["Earth", "Saturn", "Jupiter", "Uranus"], correctAnswer: 2),
        // Add more questions here...
    ]
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
}

let quizShared = QuizShared()

// View for the quiz
struct QuizView: View {
    @ObservedObject var quiz: QuizShared

    init() {
        self.quiz = quizShared
    }

    var body: some View {
        VStack {
            if quiz.currentQuestionIndex < quiz.questions.count {
                QuestionView(question: quiz.questions[quiz.currentQuestionIndex], quiz: quiz)
            } else {
                // Show final score
                Text("Final Score: \(quiz.score) / \(quiz.questions.count)")
                  .font(.largeTitle)
            }
        }
    }
}

// View for a single question
struct QuestionView: View {
    @State private var selectedOption: Int? = nil
    let question: Question
    @ObservedObject var quiz: QuizShared

    var body: some View {
        VStack {
            Text(question.text)
              .font(.largeTitle)
            ForEach(0..<question.options.count) { index in
                Button(action: {
                    self.selectedOption = index
                }) {
                    HStack {
                        Text(question.options[index])
                          .frame(maxWidth:.infinity, alignment:.leading)
                        if self.selectedOption == index {
                            Image(systemName: "checkmark")
                              .foregroundColor(.green)
                        }
                    }
                }
            }
            Button(action: {
                // Submit answer
                if let selectedOption = self.selectedOption {
                    if selectedOption == question.correctAnswer {
                        // Correct answer, increment score
                        self.quiz.score += 1
                    }
                    // Move to next question
                    self.quiz.currentQuestionIndex += 1
                }
            }) {
                Text("Submit")
                  .frame(maxWidth:.infinity)
            }
        }
      .padding()
    }
}

//@main
//struct QuizApp: App {
//    var body: some Scene {
//        WindowGroup {
//            QuizView()
//        }
//    }
//}
