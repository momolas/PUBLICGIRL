//
//  NubianPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct NubianPyramidView: View {
    @State private var viewModel = NubianViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Pyramide Nubienne")
                .font(.largeTitle)
                .bold()

            Text("Entrez la base pour calculer")
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer()

            TextField("Base", value: $viewModel.base, format: .number)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .keyboardType(.decimalPad)

            Button(action: {
                viewModel.calculate()
            }) {
                Label("Calculer", systemImage: "function")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if let result = viewModel.result {
                VStack(spacing: 10) {
                    Divider()

                    ResultRowNubian(title: "Arrête", value: result.arrete)
                    ResultRowNubian(title: "Hauteur", value: result.hauteur)
                    ResultRowNubian(title: "Apothème", value: result.apotheme)
                    ResultRowNubian(title: "Surface", value: result.surfaceArea)
                    ResultRowNubian(title: "Volume", value: result.volume)
                }
                .padding()
                .background(Color.secondary.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultRowNubian: View {
    let title: String
    let value: Double

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value, format: .number.precision(.fractionLength(3)))
                .bold()
        }
    }
}

#Preview {
    NavigationStack {
        NubianPyramidView()
            .preferredColorScheme(.dark)
    }
}
