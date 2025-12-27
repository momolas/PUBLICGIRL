//
//  GoldenRatioPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct GoldenRatioPyramidView: View {

    @State private var viewModel = GoldenRatioViewModel()

    var isInputValid: Bool {
        viewModel.base > 0 && viewModel.height > 0
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Nombre d'Or")
                    .font(.largeTitle)
                    .bold()
                    .accessibilityAddTraits(.isHeader)

                Text("Entrez les dimensions pour calculer")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer(minLength: 20)

                VStack(spacing: 15) {
                    TextField("Base", value: $viewModel.base, format: .number)
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .keyboardType(.decimalPad)
                        .accessibilityLabel("Base de la pyramide")
                        .accessibilityHint("Entrez la longueur de la base")

                    TextField("Hauteur", value: $viewModel.height, format: .number)
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .keyboardType(.decimalPad)
                        .accessibilityLabel("Hauteur de la pyramide")
                        .accessibilityHint("Entrez la hauteur de la pyramide")
                }
                .dismissKeyboardOnTap()

                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        viewModel.calculate()
                    }
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }) {
                    Label("Calculer", systemImage: "function")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isInputValid ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(isInputValid ? .primary : .secondary)
                }
                .disabled(!isInputValid)
                .accessibilityLabel("Lancer le calcul")
                .accessibilityHint(isInputValid ? "Calcule les dimensions basées sur vos entrées" : "Veuillez entrer des valeurs valides supérieures à 0")

                if let result = viewModel.result {
                    VStack(spacing: 10) {
                        Divider()

                        PyramidResultRow(title: "Base Kheops", value: result.baseKheops, precision: 2)
                        PyramidResultRow(title: "Volume", value: result.volume, precision: 2)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .transition(.scale.combined(with: .opacity))
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Résultats du calcul")
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GoldenRatioPyramidView()
            .preferredColorScheme(.dark)
    }
}
