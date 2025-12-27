//
//  File.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import Foundation

var phi = (1.0 + sqrt(5.0)) / 2

var equalA = true

var longueurBase = 1.0

var hauteurBase = longueurBase / phi

//Le 1/2 périmètre de la pyramide au sol divisé par la hauteur au sol est égal à PI.
//2a / h = π
//La hauteur de la pyramide multiplié par la racine carré de PHI est égale à l’apothème de la pyramide.
//h * sqrt(phi) = ap
//La hauteur de la pyramide divisé par racine carré de PHI égale la 1/2 base de la pyramide.
//h / sqrt(phi) = a / 2

//la longueur de l’arrête est la longueur d’un coté multiplié par le nombre d’or de 1,618.


func calc(x: Double) -> Double {
	if equalA {
		let y = x * phi
		return y
	} else {
		let y = x / phi
		return y
	}
}
