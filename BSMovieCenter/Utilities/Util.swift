//
//  Util.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import Foundation

struct Util {
    
    static func minutesToHoursAndMinutes(_ minutes: Int) -> String {
      let hours = minutes / 60
      let minutesRemaining = minutes % 60

      if minutesRemaining == 0 {
        return "\(hours) hour"
      } else {
        return "\(hours) hour \(minutesRemaining) mins"
      }
    }
    
    static func minutesToHoursAndMinutesPoster(_ minutes: Int) -> String {
      let hours = minutes / 60
      let minutesRemaining = minutes % 60

      if minutesRemaining == 0 {
        return "\(hours) h"
      } else {
        return "\(hours)h \(minutesRemaining)m"
      }
    }
}
