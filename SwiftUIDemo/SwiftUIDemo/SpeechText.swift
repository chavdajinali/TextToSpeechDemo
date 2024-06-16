//
//  SpeechText.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 16/06/24.
//

import SwiftUI
import AVFAudio


class SpeechToTextModel: NSObject, AVSpeechSynthesizerDelegate, ObservableObject {
    
    @Published var text: String = ""
    @Published var speaking: Bool = false
        
    let synthesizer = AVSpeechSynthesizer()
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func speakText() {
        speaking = true
        synthesizer.stopSpeaking(at:.immediate)
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
        utterance.rate = 0.1
        
        synthesizer.speak(utterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        speaking = false
    }
}

struct SpeechText: View {
    
    @State private var selection = AVSpeechSynthesisVoice(language: "en-IN")
    let voices = AVSpeechSynthesisVoice.speechVoices()

    @StateObject var model = SpeechToTextModel()
    
    var body: some View {
        VStack{
//            Picker("Select a voice Language", selection: $selection) {
//                ForEach(voices, id: \.self) {
//                    Text("\($0.identifier)")
//                }
//            }
//            .pickerStyle(.menu)
            
            Text("Voice: \(selection?.identifier ?? "en_IN")")
            
            if selection?.identifier != "" {
                TextField("Enter text to speak", text: $model.text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    model.speakText()
                }) {
                    Text("Speak")
                        .frame(maxWidth:.infinity)
                }
                .padding()
                .disabled(model.speaking)
            }else{
                
            }

        }
       
    }
    
}

#Preview {
    SpeechText()
}
