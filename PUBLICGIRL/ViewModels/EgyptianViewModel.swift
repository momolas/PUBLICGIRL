import Foundation
import Observation

@MainActor
@Observable
class EgyptianViewModel {
    var base: Double = 0.0
    var result: PyramidCalculator.PyramidDimensions?

    func calculate() {
        result = PyramidCalculator.calculateEgyptian(base: base)
    }
}
