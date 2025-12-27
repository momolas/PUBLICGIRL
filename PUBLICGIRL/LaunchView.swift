//
//  ContentView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct LaunchView: View {

    // Enum to define navigation destinations
    enum PyramidType: String, CaseIterable, Hashable {
        case goldenRatio = "Pyramide au Nombre d'Or"
        case egyptian = "Pyramide Égyptienne"
        case nubian = "Pyramide Nubienne"
    }
	
	var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				
				Spacer()
				
				Text("PUBLICGIRL")
					.font(.largeTitle)
				
				Text("Une application pour calculer les dimensions d'une pyramide")
					.font(.caption)
				
				Spacer()

                NavigationLink(value: PyramidType.goldenRatio) {
                    Label("Pyramide au Nombre d'Or", systemImage: "arrow.triangle.2.circlepath")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                NavigationLink(value: PyramidType.egyptian) {
                    Label("Pyramide Égyptienne", systemImage: "pyramid")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                NavigationLink(value: PyramidType.nubian) {
                    Label("Pyramide Nubienne", systemImage: "triangle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
				
				Spacer()
				Spacer()
			}
            .padding()
			.navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: PyramidType.self) { type in
                switch type {
                case .goldenRatio:
                    GoldenRatioPyramidView()
                case .egyptian:
                    EgyptianPyramidView()
                case .nubian:
                    NubianPyramidView()
                }
            }
		}
	}
}

#Preview {
	LaunchView()
		.preferredColorScheme(.dark)
}
