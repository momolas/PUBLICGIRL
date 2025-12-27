//
//  ContentView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct LaunchView: View {
	
	var body: some View {
		NavigationStack {
			VStack {
				
				Spacer()
				
				Text("PUBLICGIRL")
					.font(.largeTitle)
				
				Text("Une application pour calculer les dimensions d'une pyramide")
					.font(.caption)
				
				Spacer()
				
				NavigationLink(destination: SwiftUIView(), label: { Image(systemName: "arrow.triangle.2.circlepath")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.green)
						.frame(width: 200, height: 200)
				})
				
				Spacer()
				Spacer()
			}
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

#Preview {
	LaunchView()
		.preferredColorScheme(.dark)
}
