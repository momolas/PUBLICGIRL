import XCTest
@testable import PUBLICGIRL

final class PyramidCalculatorTests: XCTestCase {

    func testGoldenRatioCalculation() {
        let base = 10.0
        let height = 8.0
        let result = PyramidCalculator.calculateGoldenRatio(base: base, height: height)

        let expectedVolume = (1.0 / 3.0) * pow(base, 2) * height
        let expectedBaseKheops = height * ((1.0 + sqrt(5.0)) / 2.0)

        XCTAssertEqual(result.volume, expectedVolume, accuracy: 0.0001)
        XCTAssertEqual(result.baseKheops, expectedBaseKheops, accuracy: 0.0001)
    }

    func testEgyptianPyramidCalculation() {
        let base = 10.0
        let result = PyramidCalculator.calculateEgyptian(base: base)

        let phi = (1.0 + sqrt(5.0)) / 2.0
        let expectedArrete = base / (2 * phi)
        let expectedHauteur = expectedArrete * phi

        XCTAssertEqual(result.arrete, expectedArrete, accuracy: 0.0001)
        XCTAssertEqual(result.hauteur, expectedHauteur, accuracy: 0.0001)
    }

    func testNubianPyramidCalculation() {
        let base = 10.0
        let result = PyramidCalculator.calculateNubian(base: base)

        let phi = (1.0 + sqrt(5.0)) / 2.0
        let expectedArrete = base * phi
        let expectedHauteur = expectedArrete * phi

        XCTAssertEqual(result.arrete, expectedArrete, accuracy: 0.0001)
        XCTAssertEqual(result.hauteur, expectedHauteur, accuracy: 0.0001)
    }
}
