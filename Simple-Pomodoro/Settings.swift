//
//  Settings.swift
//  Simple-Pomodoro
//
//  Created by manan jain on 08/02/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(AppTypography.title)
                    .padding()

                Text("More settings will be added soon!")
                    .font(AppTypography.buttonText)
                    .padding()

                Spacer()

                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(AppColors.accentColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}
