//
//  TextSpeech.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI
import AVFoundation
import Combine

class TextToSpeechModel: NSObject, AVSpeechSynthesizerDelegate, ObservableObject {
    
    @Published var text: String = ""
    @Published var voiceSelected :AVSpeechSynthesisVoice =  AVSpeechSynthesisVoice(language: "en-IN")!
    @Published var speaking: Bool = false
    @Published var voicelanguageArr = [AVSpeechSynthesisVoice]()
    
    let voices = AVSpeechSynthesisVoice.speechVoices()

    let synthesizer = AVSpeechSynthesizer()

    override init() {
        super.init()
        getlanguageVoices()
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
    
    func getlanguageVoices(){
        voicelanguageArr = voices
        for voice in voices {
            print("Name : \(voice.name)Voice Identifier: \(voice.identifier), Language: \(voice.language)")
        }
    }
}

struct TextToSpeechView: View {
    @StateObject var model = TextToSpeechModel()
    
    @Binding var selection: String?

    var body: some View {
        VStack {
            
            Picker("Please Select Voice language", selection: $selection) {
                ForEach($model.voicelanguageArr, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.menu)
            
        }
        
        if $selection.wrappedValue != "" {
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
        }
        if model.speaking {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        
    
    }
}

//struct TextToSpeechView: View {
//    @StateObject var synthesizer = AVSpeechSynthesizer()
//    @State private var selectedVoice: AVSpeechSynthesisVoice?
//
//    var body: some View {
//        VoiceMenu(selectedVoice: $selectedVoice)
//            .onChange(of: selectedVoice) { voice in
//                synthesizer.voice = voice
//            }
//    }
//}


//struct TextToSpeechView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextToSpeechView()
//    }
//}

struct VoiceMenu: View {
    @State private var showMenu = false
    @State private var selectedVoice: AVSpeechSynthesisVoice?

    let voices = AVSpeechSynthesisVoice.speechVoices()

    var body: some View {
        Button(action: {
            showMenu.toggle()
        }) {
            Text("Select Voice")
                .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $showMenu) {
            VoiceMenuList(voices: voices, selectedVoice: $selectedVoice)
        }
    }
}

struct VoiceMenuList: View {
    let voices: [AVSpeechSynthesisVoice]
    @Binding var selectedVoice: AVSpeechSynthesisVoice?

    var body: some View {
        List {
            ForEach(voices, id: \.identifier) { voice in
                Button(action: {
                    selectedVoice = voice
                }) {
                    HStack {
                        Text(voice.name)
                        Spacer()
                        if voice.identifier == selectedVoice?.identifier {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        }
    }
}
