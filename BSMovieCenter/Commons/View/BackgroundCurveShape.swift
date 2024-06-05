//
//  BackgroundCurveShape.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation
import SwiftUI

struct BackgroundCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.34851*height))
        path.addCurve(to: CGPoint(x: 0, y: height), control1: CGPoint(x: 0, y: 0.57757*height), control2: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0.00202*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.34851*height), control1: CGPoint(x: 0.68182*width, y: 0.27771*height), control2: CGPoint(x: 0, y: 0.11944*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: width, y: 0.0012*height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0.99919*width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.0012*height))
        path.closeSubpath()
        return path
    }
}

