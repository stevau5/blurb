//
//  Word.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-05.
//

import SwiftUI
import AVFoundation

var counter = 0;

struct Word: View {
    let word: String;
    let translation: String;
    let code: String;
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.word)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .padding(.horizontal)
                Text(self.translation)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color(red: 224 / 255.0, green: 251 / 255.0, blue: 226 / 255.0))
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            speak(self.translation)
        }
    }
    
    func speak(_ word: String) {
        let apiKey = "sk-proj-cbFnUlXhi522uLN0LIVmT3BlbkFJgMjKoInIYkuFHSb4D81K"
        let url = URL(string: "https://api.openai.com/v1/audio/speech")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = [
            "input": word,
            "voice": "alloy",
            "model": "tts-1",
            "language": "en",
            "response_format": "mp3",
            "speed": "0.75"
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            playAudio(data: data)
        }.resume()
        
        func playAudio(data: Data) {
            do {
                audioPlayer = try AVAudioPlayer(data: data)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    Word(word: "Where is the washroom?", translation: "Ou sont les toilettes?", code: "ja")
}
