import Foundation

struct PyramidCalculator {
    static let phi = (1.0 + sqrt(5.0)) / 2.0

    struct PyramidDimensions {
        var arrete: Double
        var hauteur: Double
        var apotheme: Double
        var surfaceArea: Double
        var volume: Double
    }

    struct GoldenRatioResult {
        var volume: Double
        var baseKheops: Double
    }

    /// Calculates dimensions for an Egyptian Pyramid based on base.
    /// Logic from original SwiftUIView2.
    static func calculateEgyptian(base: Double) -> PyramidDimensions {
        let arrete = base / (2 * phi)
        let hauteur = arrete * phi
        let apotheme = sqrt(pow(hauteur, 2) + pow(arrete, 2))
        let surfaceArea = base * apotheme
        let volume = (1.0 / 3.0) * base * hauteur

        return PyramidDimensions(
            arrete: arrete,
            hauteur: hauteur,
            apotheme: apotheme,
            surfaceArea: surfaceArea,
            volume: volume
        )
    }

    /// Calculates dimensions for a Nubian Pyramid based on base.
    /// Logic from original SwiftUIView3.
    static func calculateNubian(base: Double) -> PyramidDimensions {
        let arrete = base * phi
        let hauteur = arrete * phi
        let apotheme = sqrt(pow(hauteur, 2) + pow(arrete, 2))
        let surfaceArea = base * apotheme
        let volume = (1.0 / 3.0) * base * hauteur

        return PyramidDimensions(
            arrete: arrete,
            hauteur: hauteur,
            apotheme: apotheme,
            surfaceArea: surfaceArea,
            volume: volume
        )
    }

    /// Calculates volume and theoretical Kheops base for a Golden Ratio Pyramid.
    /// Logic from original SwiftUIView.
    static func calculateGoldenRatio(base: Double, height: Double) -> GoldenRatioResult {
        let volume = (1.0 / 3.0) * pow(base, 2) * height
        let baseKheops = height * phi
        return GoldenRatioResult(volume: volume, baseKheops: baseKheops)
    }
}
