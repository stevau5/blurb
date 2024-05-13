//
//  AddLanguageCard.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-22.
//

import SwiftUI
import UIKit

struct AddLanguageCard: View {
    @State private var isPressed = false
    @State private var isShowingSheet = false
    @EnvironmentObject var languageViewModel: LanguageViewModel
    
    var body: some View {
        Button(action: {
            self.isPressed.toggle()
            self.triggerHapticFeedback()
            self.isShowingSheet = true
            languageViewModel.wasLanguageSelected = false
            self.isPressed.toggle()
        }, label: {
            // The "+" symbol, styled to look like a button
           Image(systemName: "plus")
               .font(.system(size: 24, weight: .bold))
               .foregroundColor(.white)
               .padding()
               .background(Circle().fill(Color.blue))
               .overlay(
                   Circle()
                       .stroke(Color.blue, lineWidth: 2)
                       .scaleEffect(isPressed ? 1.1 : 1) // Slightly enlarge the circle on press
                       .opacity(isPressed ? 0.5 : 1) // Fade the border on press
               )
        })
            .scaleEffect(isPressed ? 1.2 : 1) // Enlarge the button itself on press
            .animation(.easeInOut(duration: 0.2), value: isPressed) // Animate the scaling effect
            .sheet(isPresented: isSheetPresentable) {
                LanguageSelector()
            }
    }
    
    var isSheetPresentable: Binding<Bool> {
        Binding(
            get: {
                self.isShowingSheet && !languageViewModel.wasLanguageSelected
            },
            set: {
                self.isShowingSheet = $0
            }
        )
    }
    
    func triggerHapticFeedback () {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare() // Prepare the generator to reduce latency
        generator.impactOccurred() // Trigger the haptic feedback
    }
    func languageWasSelected () {
        print("something happened")
    }
}

#Preview {
    AddLanguageCard()
}
