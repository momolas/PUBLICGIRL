import Foundation
import Observation

@MainActor
@Observable
class GoldenRatioViewModel {
    var base: Double = 0.0
    var height: Double = 0.0
    var result: PyramidCalculator.GoldenRatioResult?

    func calculate() {
        result = PyramidCalculator.calculateGoldenRatio(base: base, height: height)
    }
}
