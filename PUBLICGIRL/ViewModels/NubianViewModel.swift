import Foundation
import Observation

@MainActor
@Observable
class NubianViewModel {
    var base: Double = 0.0
    var result: PyramidCalculator.PyramidDimensions?

    func calculate() {
        result = PyramidCalculator.calculateNubian(base: base)
    }
}
