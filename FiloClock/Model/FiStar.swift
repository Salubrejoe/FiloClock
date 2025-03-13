
import SwiftUI

/*
 J2000 catalog
 
 Name?
 
 RAh
 RAm
 RAs
 
 DEd
 DEm
 DEs
 
 Vmag
 SpectralCls
 
 pmRA - Annual proper motion in RA J2000, FK5 system
 pmDE - Annual proper motion in Dec J2000, FK5 system
 
 "ADS": "46",
 "B-V": "+0.07",
 "DE-": "+",
 "DE-1900": "+",
 "DEd": "45",
 "DEd1900": "44",
 "DEm": "13",
 "DEm1900": "40",
 "DEs": "45",
 "DEs1900": "22",
 "DM":
 "BD+44 4550",
 "Dmag": "4.2",
 "GLAT": "-16.88",
 "GLON": "114.44",
 "HD": "3",
 "HR": "1",
 "MultCnt": "3",
 "MultID": "AC",
 "RAh": "00",
 "RAh1900": "00",
 "RAm": "05",
 "RAm1900": "00",
 "RAs": "09.9",
 "RAs1900": "01.1",
 "RadVel": "-018",
 "RotVel": "195",
 "SAO": "36042",
 "Sep": "21.6",
 "SpType": "A1Vn",
 "U-B": "+0.08",
 "Vmag": "6.70",
 "pmDE": "-0.018",
 "pmRA": "-0.012" },

 
 */


struct FiStar: Identifiable {
  typealias Magnitude = Double
  let id = UUID()
  
  let name: String
  
  let j2000Declination    : Angle
  let j2000RightAscension : Angle
  
  let magnitude : Magnitude
  let hrClass   : HertzsprungRussellClass
  
  init(
    name: String,
    j2000Declination: Angle,
    j2000RightAscension: Angle,
    magnitude: Magnitude,
    hrClass: HertzsprungRussellClass
  ) {
    self.name = name
    self.j2000Declination = j2000Declination
    self.j2000RightAscension = j2000RightAscension
    self.magnitude = magnitude
    self.hrClass = hrClass
  }
}

// MARK: - ZODIAC SIGNS
extension FiStar {
  static let aries = FiStar(
    name: "♈︎",
    j2000Declination: .init(degrees: 17, arcMinutes: 27, arcSeconds: 51),
    j2000RightAscension: .init(hours: 2, minutes: 49, seconds: 17),
    magnitude: 5.22,
    hrClass: .B
  )
  
  static let taurus = FiStar(
    name: "♉︎",
    j2000Declination: .init(degrees: 16, arcMinutes: 30, arcSeconds: 33),
    j2000RightAscension: .init(hours: 4, minutes: 35, seconds: 55),
    magnitude: 0.85,
    hrClass: .K
  )
  
  static let gemini = FiStar(
    name: "♊︎",
    j2000Declination: .init(degrees: 21, arcMinutes: 58, arcSeconds: 55),
    j2000RightAscension: .init(hours: 7, minutes: 20, seconds: 7),
    magnitude: 3.53,
    hrClass: .F
  )
  
  static let cancer = FiStar(
    name: "♋︎",
    j2000Declination: .init(degrees: 18, arcMinutes: 9, arcSeconds: 15),
    j2000RightAscension: .init(hours: 8, minutes: 44, seconds: 41),
    magnitude: 3.94,
    hrClass: .K
  )
  
  static let leo = FiStar(
    name: "♌︎",
    j2000Declination: .init(degrees: 11, arcMinutes: 58, arcSeconds: 1),
    j2000RightAscension: .init(hours: 10, minutes: 8, seconds: 22),
    magnitude: 1.35,
    hrClass: .B
  )
  
  static let virgo = FiStar(
    name: "♍︎",
    j2000Declination: .init(degrees: -1, arcMinutes: 26, arcSeconds: 57),
    j2000RightAscension: .init(hours: 12, minutes: 41, seconds: 39),
    magnitude: 3.65,
    hrClass: .F
  )
  
  static let libra = FiStar(
    name: "♎︎",
    j2000Declination: .init(degrees: -16, arcMinutes: 02, arcSeconds: 30),
    j2000RightAscension: .init(hours: 14, minutes: 50, seconds: 52),
    magnitude: 2.75,
    hrClass: .A
  )
  
  static let scorpio = FiStar(
    name: "♏︎",
    j2000Declination: .init(degrees: -19, arcMinutes: 48, arcSeconds: 20),
    j2000RightAscension: .init(hours: 16, minutes: 05, seconds: 26),
    magnitude: 2.62,
    hrClass: .B
  )
  
  static let sagittarius = FiStar(
    name: "♐︎",
    j2000Declination: .init(degrees: -25, arcMinutes: 25, arcSeconds: 18),
    j2000RightAscension: .init(hours: 18, minutes: 27, seconds: 58),
    magnitude: 2.81,
    hrClass: .K
  )
  
  static let capricorn = FiStar(
    name: "♑︎",
    j2000Declination: .init(degrees: -17, arcMinutes: 13, arcSeconds: 58),
    j2000RightAscension: .init(hours: 21, minutes: 05, seconds: 56),
    magnitude: 4.07,
    hrClass: .A
  )
  
  static let aquarius = FiStar(
    name: "♒︎",
    j2000Declination: .init(degrees: -7, arcMinutes: 46, arcSeconds: 59),
    j2000RightAscension: .init(hours: 22, minutes: 16, seconds: 50),
    magnitude: 4.16,
    hrClass: .G
  )
  
  static let pisces = FiStar(
    name: "♓︎",
    j2000Declination: .init(degrees: 7, arcMinutes: 53, arcSeconds: 23),
    j2000RightAscension: .init(hours: 1, minutes: 2, seconds: 56),
    magnitude: 4.28,
    hrClass: .K
  )
  
  static let zodiacSigns: [FiStar] = [
    aries, taurus, gemini, cancer, leo, virgo, libra, scorpio,
    sagittarius, capricorn, aquarius, pisces
  ]
}

// MARK: - CASSIOPEIA
extension FiStar {
  static let alphaCassiopeia: FiStar = .init(
    name: "Schedar",
    j2000Declination: .init(degrees: 56, arcMinutes: 32, arcSeconds: 13),
    j2000RightAscension: .init(hours: 0, minutes: 40, seconds: 30),
    magnitude: 2.23,
    hrClass: .K
  )
  
  static let betaCassiopeia = FiStar(
    name: "Caph",
    j2000Declination: .init(degrees: 59, arcMinutes: 9, arcSeconds: 0),
    j2000RightAscension: .init(hours: 0, minutes: 9, seconds: 10),
    magnitude: 2.28,
    hrClass: .F
  )
  
  static let gammaCassiopeia = FiStar(
    name: "Tsih",
    j2000Declination: .init(degrees: 60, arcMinutes: 43, arcSeconds: 0),
    j2000RightAscension: .init(hours: 0, minutes: 56, seconds: 42),
    magnitude: 2.47,
    hrClass: .B
  )
  
  static let deltaCassiopeia = FiStar(
    name: "Ruchbah",
    j2000Declination: .init(degrees: 60, arcMinutes: 14, arcSeconds: 7),
    j2000RightAscension: .init(hours: 1, minutes: 25, seconds: 49),
    magnitude: 2.68,
    hrClass: .A
  )
  
  static let epsilonCassiopeia = FiStar(
    name: "Segin",
    j2000Declination: .init(degrees: 63, arcMinutes: 40, arcSeconds: 12),
    j2000RightAscension: .init(hours: 1, minutes: 54, seconds: 23),
    magnitude: 3.38,
    hrClass: .B
  )
  
  static let cassiopeiaStars: [FiStar] = [
    alphaCassiopeia, betaCassiopeia, gammaCassiopeia, deltaCassiopeia, epsilonCassiopeia
  ]
}


// MARK: - URSA MAJOR
extension FiStar {
  static let dubhe = FiStar(
    name: "Dubhe",
    j2000Declination: .init(degrees: 61, arcMinutes: 45, arcSeconds: 3),
    j2000RightAscension: .init(hours: 11, minutes: 3, seconds: 43),
    magnitude: 1.79,
    hrClass: .K
  )
  
  static let merak = FiStar(
    name: "Merak",
    j2000Declination: .init(degrees: 56, arcMinutes: 22, arcSeconds: 56),
    j2000RightAscension: .init(hours: 11, minutes: 1, seconds: 50),
    magnitude: 2.37,
    hrClass: .A
  )
  
  static let phecda = FiStar(
    name: "Phecda",
    j2000Declination: .init(degrees: 53, arcMinutes: 41, arcSeconds: 41),
    j2000RightAscension: .init(hours: 11, minutes: 53, seconds: 49),
    magnitude: 2.44,
    hrClass: .A
  )
  
  static let megrez = FiStar(
    name: "Megrez",
    j2000Declination: .init(degrees: 57, arcMinutes: 1, arcSeconds: 58),
    j2000RightAscension: .init(hours: 12, minutes: 15, seconds: 25),
    magnitude: 3.32,
    hrClass: .A
  )
  
  static let alioth = FiStar(
    name: "Alioth",
    j2000Declination: .init(degrees: 55, arcMinutes: 57, arcSeconds: 35),
    j2000RightAscension: .init(hours: 12, minutes: 54, seconds: 1),
    magnitude: 1.76,
    hrClass: .A
  )
  
  static let mizar = FiStar(
    name: "Mizar",
    j2000Declination: .init(degrees: 54, arcMinutes: 55, arcSeconds: 31),
    j2000RightAscension: .init(hours: 13, minutes: 23, seconds: 55),
    magnitude: 2.04,
    hrClass: .A
  )
  
  static let alkaid = FiStar(
    name: "Alkaid",
    j2000Declination: .init(degrees: 49, arcMinutes: 18, arcSeconds: 48),
    j2000RightAscension: .init(hours: 13, minutes: 47, seconds: 32),
    magnitude: 1.86,
    hrClass: .B
  )
}


// MARK: - URSA MINOR
extension FiStar {
  static let polaris = FiStar(
    name: "Polaris",
    j2000Declination: .init(degrees: 89, arcMinutes: 15, arcSeconds: 51),
    j2000RightAscension: .init(hours: 2, minutes: 31, seconds: 48),
    magnitude: 2.02,
    hrClass: .F
  )
  
  static let kochab = FiStar(
    name: "Kochab",
    j2000Declination: .init(degrees: 74, arcMinutes: 9, arcSeconds: 20),
    j2000RightAscension: .init(hours: 14, minutes: 50, seconds: 42),
    magnitude: 2.08,
    hrClass: .K
  )
  
  static let pherkad = FiStar(
    name: "Pherkad",
    j2000Declination: .init(degrees: 71, arcMinutes: 50, arcSeconds: 2),
    j2000RightAscension: .init(hours: 15, minutes: 20, seconds: 43),
    magnitude: 3.05,
    hrClass: .A
  )
  
  static let yildun = FiStar(
    name: "Yildun",
    j2000Declination: .init(degrees: 86, arcMinutes: 35, arcSeconds: 11),
    j2000RightAscension: .init(hours: 17, minutes: 32, seconds: 12),
    magnitude: 4.36,
    hrClass: .A
  )
  
  static let epsilonUMi = FiStar(
    name: "Epsilon Ursae Minoris",
    j2000Declination: .init(degrees: 82, arcMinutes: 02, arcSeconds: 13),
    j2000RightAscension: .init(hours: 16, minutes: 45, seconds: 58),
    magnitude: 4.23,
    hrClass: .G
  )
  
  static let zetaUMi = FiStar(
    name: "Zeta Ursae Minoris",
    j2000Declination: .init(degrees: 75, arcMinutes: 47, arcSeconds: 39),
    j2000RightAscension: .init(hours: 15, minutes: 44, seconds: 3),
    magnitude: 4.32,
    hrClass: .A
  )
  
  static let etaUMi = FiStar(
    name: "Eta Ursae Minoris",
    j2000Declination: .init(degrees: 75, arcMinutes: 45, arcSeconds: 19),
    j2000RightAscension: .init(hours: 14, minutes: 17, seconds: 30),
    magnitude: 4.95,
    hrClass: .F
  )
}


// MARK: - Virgo
extension FiStar {
  static let alphaVirginis = FiStar(
    name: "Spica",
    j2000Declination: .init(degrees: -11, arcMinutes: 9, arcSeconds: 41),
    j2000RightAscension: .init(hours: 13, minutes: 25, seconds: 11),
    magnitude: 0.98,
    hrClass: .B
  )
  
  static let betaVirginis = FiStar(
    name: "Zavijava",
    j2000Declination: .init(degrees: 1, arcMinutes: 45, arcSeconds: 52),
    j2000RightAscension: .init(hours: 11, minutes: 50, seconds: 41),
    magnitude: 3.61,
    hrClass: .F
  )
  
  static let gammaVirginis = FiStar(
    name: "Porrima",
    j2000Declination: .init(degrees: -1, arcMinutes: 26, arcSeconds: 57),
    j2000RightAscension: .init(hours: 12, minutes: 41, seconds: 39),
    magnitude: 3.65,
    hrClass: .F
  )
  
  static let deltaVirginis = FiStar(
    name: "Minelauva",
    j2000Declination: .init(degrees: 3, arcMinutes: 23, arcSeconds: 50),
    j2000RightAscension: .init(hours: 12, minutes: 55, seconds: 36),
    magnitude: 3.38,
    hrClass: .M
  )
  
  static let epsilonVirginis = FiStar(
    name: "Epsilon Virginis",
    j2000Declination: .init(degrees: 10, arcMinutes: 57, arcSeconds: 33),
    j2000RightAscension: .init(hours: 13, minutes: 2, seconds: 10),
    magnitude: 2.83,
    hrClass: .G
  )
  
  static let zetaVirginis = FiStar(
    name: "Zeta Virginis",
    j2000Declination: .init(degrees: 0, arcMinutes: 35, arcSeconds: 44),
    j2000RightAscension: .init(hours: 13, minutes: 34, seconds: 41),
    magnitude: 3.37,
    hrClass: .A
  )
  
  static let etaVirginis = FiStar(
    name: "Zaniah",
    j2000Declination: .init(degrees: 0, arcMinutes: 40, arcSeconds: 0),
    j2000RightAscension: .init(hours: 12, minutes: 19, seconds: 64),
    magnitude: 4.38,
    hrClass: .A
  )
  
  static let thetaVirginis = FiStar(
    name: "Theta Virginis",
    j2000Declination: .init(degrees: -5, arcMinutes: 32, arcSeconds: 20),
    j2000RightAscension: .init(hours: 13, minutes: 9, seconds: 56),
    magnitude: 4.38,
    hrClass: .A
  )
  
  
  static let iotaVirginis = FiStar(
    name: "Syrma",
    j2000Declination: .init(degrees: -6, arcMinutes: 0, arcSeconds: 2),
    j2000RightAscension: .init(hours: 14, minutes: 16, seconds: 00),
    magnitude: 4.08,
    hrClass: .F
  )
  
  static let muVirginis = FiStar(
    name: "Mu Virginis",
    j2000Declination: .init(degrees: -5, arcMinutes: 39, arcSeconds: 29),
    j2000RightAscension: .init(hours: 14, minutes: 43, seconds: 03),
    magnitude: 3.88,
    hrClass: .F
  )
  
  static let nuVirginis = FiStar(
    name: "Nu Virginis",
    j2000Declination: .init(degrees: 6, arcMinutes: 31, arcSeconds: 45),
    j2000RightAscension: .init(hours: 11, minutes: 45, seconds: 51),
    magnitude: 4.03,
    hrClass: .M
  )
  
  static let omicronVirginis = FiStar(
    name: "Omicron Virginis",
    j2000Declination: .init(degrees: 8, arcMinutes: 43, arcSeconds: 59),
    j2000RightAscension: .init(hours: 12, minutes: 5, seconds: 12),
    magnitude: 4.12,
    hrClass: .G
  )
  
  static let tauVirginis = FiStar(
    name: "Tau Virginis",
    j2000Declination: .init(degrees: 1, arcMinutes: 32, arcSeconds: 39),
    j2000RightAscension: .init(hours: 14, minutes: 1, seconds: 38),
    magnitude: 4.26,
    hrClass: .A
  )
}


// MARK: - Aquarius
extension FiStar {
  static let alphaAquarii = FiStar(
    name: "Sadalmelik",
    j2000Declination: .init(degrees: -0, arcMinutes: 19, arcSeconds: 10),
    j2000RightAscension: .init(hours: 22, minutes: 05, seconds: 47),
    magnitude: 2.96,
    hrClass: .G
  )
  
  static let betaAquarii = FiStar(
    name: "Sadalsuud",
    j2000Declination: .init(degrees: -5, arcMinutes: 34, arcSeconds: 15),
    j2000RightAscension: .init(hours: 21, minutes: 31, seconds: 33),
    magnitude: 2.91,
    hrClass: .G
  )
  
  static let gammaAquarii = FiStar(
    name: "Sadachbia",
    j2000Declination: .init(degrees: -1, arcMinutes: 23, arcSeconds: 13),
    j2000RightAscension: .init(hours: 22, minutes: 21, seconds: 39),
    magnitude: 3.84,
    hrClass: .A
  )
  
  static let deltaAquarii = FiStar(
    name: "Skat",
    j2000Declination: .init(degrees: -15, arcMinutes: 49, arcSeconds: 14),
    j2000RightAscension: .init(hours: 22, minutes: 54, seconds: 38),
    magnitude: 3.27,
    hrClass: .A
  )
  
  static let epsilonAquarii = FiStar(
    name: "Albali",
    j2000Declination: .init(degrees: -9, arcMinutes: 29, arcSeconds: 44),
    j2000RightAscension: .init(hours: 20, minutes: 47, seconds: 40),
    magnitude: 3.77,
    hrClass: .A
  )
  
  static let zetaAquarii = FiStar(
    name: "Zeta Aquarii",
    j2000Declination: .init(degrees: 0, arcMinutes: 01, arcSeconds: 12),
    j2000RightAscension: .init(hours: 22, minutes: 28, seconds: 50),
    magnitude: 4.42,
    hrClass: .F
  )
  
  static let etaAquarii = FiStar(
    name: "Eta Aquarii",
    j2000Declination: .init(degrees: 0, arcMinutes: 7, arcSeconds: 2),
    j2000RightAscension: .init(hours: 22, minutes: 35, seconds: 12),
    magnitude: 4.38,
    hrClass: .A
  )
  
  static let thetaAquarii = FiStar(
    name: "Ancha",
    j2000Declination: .init(degrees: -7, arcMinutes: 46, arcSeconds: 59),
    j2000RightAscension: .init(hours: 22, minutes: 16, seconds: 50),
    magnitude: 4.16,
    hrClass: .G
  )
  
  static let iotaAquarii = FiStar(
    name: "Iota Aquarii",
    j2000Declination: .init(degrees: -13, arcMinutes: 52, arcSeconds: 10),
    j2000RightAscension: .init(hours: 22, minutes: 06, seconds: 26),
    magnitude: 4.27,
    hrClass: .B
  )
  
  static let lambdaAquarii = FiStar(
    name: "Lambda Aquarii",
    j2000Declination: .init(degrees: -7, arcMinutes: 34, arcSeconds: 46),
    j2000RightAscension: .init(hours: 22, minutes: 52, seconds: 36),
    magnitude: 3.74,
    hrClass: .M
  )
  
  static let tauAquarii = FiStar(
    name: "Tau Aquarii",
    j2000Declination: .init(degrees: -13, arcMinutes: 35, arcSeconds: 32),
    j2000RightAscension: .init(hours: 22, minutes: 49, seconds: 35),
    magnitude: 4.01,
    hrClass: .M
  )
  
  static let fiAquarii = FiStar(
    name: "Fi Auqarii",
    j2000Declination: .init(degrees: -6, arcMinutes: 02, arcSeconds: 56),
    j2000RightAscension: .init(hours: 23, minutes: 14, seconds: 19),
    magnitude: 4.22,
    hrClass: .M
  )
  
  static let psiAquarii = FiStar(
    name: "Psi Virginis",
    j2000Declination: .init(degrees: -9, arcMinutes: 10, arcSeconds: 56),
    j2000RightAscension: .init(hours: 23, minutes: 17, seconds: 54),
    magnitude: 4.39,
    hrClass: .B
  )
}


// MARK: - Libra
extension FiStar {
  static let alphaLibrae = FiStar(
    name: "Zubenelgenubi",
    j2000Declination: .init(degrees: -16, arcMinutes: 02, arcSeconds: 30),
    j2000RightAscension: .init(hours: 14, minutes: 50, seconds: 52),
    magnitude: 2.75,
    hrClass: .A
  )
  
  static let betaLibrae = FiStar(
    name: "Zubeneschamali",
    j2000Declination: .init(degrees: -9, arcMinutes: 22, arcSeconds: 59),
    j2000RightAscension: .init(hours: 15, minutes: 17, seconds: 00),
    magnitude: 2.61,
    hrClass: .B
  )
  
  static let gammaLibrae = FiStar(
    name: "Gamma Librae",
    j2000Declination: .init(degrees: -14, arcMinutes: 47, arcSeconds: 21),
    j2000RightAscension: .init(hours: 15, minutes: 35, seconds: 31),
    magnitude: 3.91,
    hrClass: .G
  )
  
  static let upsilonLibrae = FiStar(
    name: "Upsilon Librae",
    j2000Declination: .init(degrees: -28, arcMinutes: 8, arcSeconds: 6),
    j2000RightAscension: .init(hours: 15, minutes: 37, seconds: 01),
    magnitude: 3.58,
    hrClass: .K
  )
  
  static let tauLibrae = FiStar(
    name: "Tau Librae",
    j2000Declination: .init(degrees: -29, arcMinutes: 46, arcSeconds: 40),
    j2000RightAscension: .init(hours: 15, minutes: 38, seconds: 39),
    magnitude: 3.66,
    hrClass: .B
  )
  
  static let sigmaLibrae = FiStar(
    name: "Sigma Librae",
    j2000Declination: .init(degrees: -25, arcMinutes: 16, arcSeconds: 54),
    j2000RightAscension: .init(hours: 15, minutes: 04, seconds: 04),
    magnitude: 3.29,
    hrClass: .M
  )
}


// MARK: - Aries
extension FiStar {
  static let alphaArietis = FiStar(
    name: "Hamal",
    j2000Declination: .init(degrees: 23, arcMinutes: 27, arcSeconds: 44),
    j2000RightAscension: .init(hours: 2, minutes: 7, seconds: 10),
    magnitude: 2.00,
    hrClass: .K
  )
  
  static let betaArietis = FiStar(
    name: "Sheratan",
    j2000Declination: .init(degrees: 20, arcMinutes: 48, arcSeconds: 29),
    j2000RightAscension: .init(hours: 1, minutes: 54, seconds: 38),
    magnitude: 2.64,
    hrClass: .A
  )
  
  static let gammaArietis = FiStar(
    name: "Mesarthim",
    j2000Declination: .init(degrees: 19, arcMinutes: 17, arcSeconds: 36),
    j2000RightAscension: .init(hours: 1, minutes: 53, seconds: 31),
    magnitude: 4.75,
    hrClass: .A
  )
  
  static let deltaArietis = FiStar(
    name: "Botein",
    j2000Declination: .init(degrees: 19, arcMinutes: 43, arcSeconds: 36),
    j2000RightAscension: .init(hours: 3, minutes: 11, seconds: 37),
    magnitude: 4.35,
    hrClass: .K
  )
}


// MARK: - Taurus
extension FiStar {
  static let alphaTauri = FiStar(
    name: "Aldebaran",
    j2000Declination: .init(degrees: 16, arcMinutes: 30, arcSeconds: 33),
    j2000RightAscension: .init(hours: 4, minutes: 35, seconds: 55),
    magnitude: 0.85,
    hrClass: .K
  )
  
  static let betaTauri = FiStar(
    name: "Elnath",
    j2000Declination: .init(degrees: 28, arcMinutes: 36, arcSeconds: 27),
    j2000RightAscension: .init(hours: 5, minutes: 26, seconds: 17),
    magnitude: 1.65,
    hrClass: .B
  )
  
  static let gammaTauri = FiStar(
    name: "Gamma Tauri",
    j2000Declination: .init(degrees: 15, arcMinutes: 37, arcSeconds: 38),
    j2000RightAscension: .init(hours: 4, minutes: 19, seconds: 47),
    magnitude: 3.65,
    hrClass: .K
  )
  
  static let deltaTauri = FiStar(
    name: "Delta Tauri",
    j2000Declination: .init(degrees: 17, arcMinutes: 32, arcSeconds: 33),
    j2000RightAscension: .init(hours: 4, minutes: 22, seconds: 56),
    magnitude: 3.76,
    hrClass: .K
  )
  
  static let epsilonTauri = FiStar(
    name: "Epsilon Tauri",
    j2000Declination: .init(degrees: 19, arcMinutes: 10, arcSeconds: 49),
    j2000RightAscension: .init(hours: 4, minutes: 28, seconds: 36),
    magnitude: 3.53,
    hrClass: .G
  )
  
  static let zetaTauri = FiStar(
    name: "Zeta Tauri",
    j2000Declination: .init(degrees: 21, arcMinutes: 8, arcSeconds: 33),
    j2000RightAscension: .init(hours: 5, minutes: 37, seconds: 38),
    magnitude: 3,
    hrClass: .B
  )
  
  static let etaTauri = FiStar(
    name: "Alcyone",
    j2000Declination: .init(degrees: 24, arcMinutes: 6, arcSeconds: 18),
    j2000RightAscension: .init(hours: 3, minutes: 47, seconds: 29),
    magnitude: 2.87,
    hrClass: .B
  )
  
  static let lambdaTauri = FiStar(
    name: "Lambda Tauri",
    j2000Declination: .init(degrees: 12, arcMinutes: 29, arcSeconds: 25),
    j2000RightAscension: .init(hours: 4, minutes: 00, seconds: 40),
    magnitude: 3.47,
    hrClass: .B
  )
  
  static let xiTauri = FiStar(
    name: "Xi Tauri",
    j2000Declination: .init(degrees: 9, arcMinutes: 43, arcSeconds: 58),
    j2000RightAscension: .init(hours: 3, minutes: 27, seconds: 10),
    magnitude: 3.74,
    hrClass: .B
  )
  
  static let nuTauri = FiStar(
    name: "Nu Tauri",
    j2000Declination: .init(degrees: 5, arcMinutes: 59, arcSeconds: 21),
    j2000RightAscension: .init(hours: 4, minutes: 3, seconds: 9),
    magnitude: 3.91,
    hrClass: .A
  )
}


