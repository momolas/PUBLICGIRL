import SwiftUI

struct PyramidResultRow: View {
    let title: String
    let value: Double
    let precision: Int

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.primary)
            Spacer()
            Text(value, format: .number.precision(.fractionLength(precision)))
                .bold()
                .foregroundStyle(.primary)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title): \(value.formatted(.number.precision(.fractionLength(precision))))")
    }
}

#Preview {
    VStack {
        PyramidResultRow(title: "Test Value", value: 123.456, precision: 2)
        PyramidResultRow(title: "Precise Value", value: 123.456789, precision: 3)
    }
    .padding()
}
