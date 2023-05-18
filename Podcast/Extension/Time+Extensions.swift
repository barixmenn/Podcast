//
//  Time+Extensions.swift
//  Podcast
//
//  Created by Baris on 18.05.2023.
//

import Foundation
import CoreMedia

extension CMTime {
    func formatString() -> String {
        let totalSecond = Int(CMTimeGetSeconds(self))
        let second = totalSecond % 60
        let minutes = totalSecond / 60
        let formatString = String(format: "%02d : %02d", minutes, second)
        return formatString
    }
    
}
