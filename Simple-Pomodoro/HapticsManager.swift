//
//  HapticsManager.swift
//  Simple-Pomodoro
//
//  Created by manan jain on 08/02/25.
//

import UIKit

class HapticsManager {
    static let shared = HapticsManager()

    private let generatorSuccess = UINotificationFeedbackGenerator()
    private let generatorImpact = UIImpactFeedbackGenerator(style: .medium)
    private let generatorWarning = UINotificationFeedbackGenerator()

    private init() {}

    func playSuccess() {
        generatorSuccess.notificationOccurred(.success)
    }

    func playWarning() {
        generatorWarning.notificationOccurred(.warning)
    }

    func playImpact() {
        generatorImpact.impactOccurred()
    }
}
