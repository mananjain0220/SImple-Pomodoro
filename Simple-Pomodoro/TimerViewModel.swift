//
//  TimerViewModel.swift
//  Simple-Pomodoro
//
//  Created by manan jain on 08/02/25.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeRemaining = 1500 // Default 25 minutes
    @Published var timerRunning = false
    @Published var progress: CGFloat = 1.0

    private var timer: Timer?
    
    init() {
           requestNotificationAuthorization()
       }
    
    private func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification authorization error: \(error.localizedDescription)")
            } else if granted {
                print("Notification authorization granted.")
            } else {
                print("Notification authorization denied.")
            }
        }
    }

    func startPauseTimer() {
        if timerRunning {
            stopTimer()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.updateTimer()
            }
        }
        timerRunning.toggle()
    }

    func resetTimer() {
        stopTimer()
        timeRemaining = 1500
        progress = 1.0
        timerRunning = false
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func updateTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            progress = CGFloat(timeRemaining) / 1500
        } else {
            stopTimer()
            timerRunning = false
        }
    }

    func timeString() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
