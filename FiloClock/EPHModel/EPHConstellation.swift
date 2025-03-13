
import Foundation


enum EPHConstellation: String, CaseIterable {
  
  case none
  case And
  case Ant
  case Aps
  case Aqr
  case Aql
  case Ara
  case Ari
  case Aur
  case Boo
  case Cae
  case Cam
  case Cap
  case Car
  case Cas
  case Cen
  case Cep
  case Cet
  case Cha
  case Cir
  case CMa
  case CMi
  case Cnc
  case Col
  case Com
  case CrA
  case CrB
  case Crt
  case Cru
  case Crv
  case CVn
  case Cyg
  case Del
  case Dor
  case Dra
  case Equ
  case Eri
  case For
  case Gem
  case Gru
  case Her
  case Hor
  case Hya
  case Hyi
  case Ind
  case Lac
  case Leo
  case Lep
  case Lib
  case LMi
  case Lup
  case Lyn
  case Lyr
  case Men
  case Mic
  case Mon
  case Mus
  case Nor
  case Oct
  case Oph
  case Ori
  case Pav
  case Peg
  case Per
  case Phe
  case Pic
  case PsA
  case Psc
  case Pup
  case Pyx
  case Ret
  case Sco
  case Scl
  case Sct
  case Ser
  case Sex
  case Sge
  case Sgr
  case Tau
  case Tel
  case TrA
  case Tri
  case Tuc
  case UMa
  case UMi
  case Vel
  case Vir
  case Vol
  case Vul
  
  var isZodiacSign: Bool {
    switch self {
    case .Ari, .Cnc, .Cap, .Gem, .Psc, .Vir, .Lib, .Aqr, .Sgr, .Tau, .Leo, .Sco : true
    default: false
    }
  }
  
  var genitive: String {
    switch self {
    case .And: "Andromedae"
    case .Aqr: "Aquarii"
    case .Aql: "Aquilae"
    case .Ari: "Arietis"
    case .Aur: "Aurigae"
    case .Boo: "Boötis"
    case .Cnc: "Cancri"
    case .CMa: "Canis Majoris"
    case .CMi: "Canis Minoris"
    case .Cap: "Capricorni"
    case .Cas: "Cassiopeiae"
    case .Cep: "Cephei"
    case .Cet: "Ceti"
    case .Cyg: "Cygni"
    case .Gem: "Geminorum"
    case .Leo: "Leonis"
    case .Lib: "Librae"
    case .Lyr: "Lyrae"
    case .Oph: "Ophiuchi"
    case .Ori: "Orionis"
    case .Peg: "Pegasi"
    case .Per: "Persei"
    case .Psc: "Piscium"
    case .Sgr: "Sagittarii"
    case .Tau: "Tauri"
    case .UMa: "Ursae Majoris"
    case .UMi: "Ursae Minoris"
    case .Vir: "Virginis"
    default: self.rawValue
    }
  }
  
  var fullName: String {
    switch self {
    case .none : "None"
    case .And : "Andromeda"
    case .Ant : "Antlia"
    case .Aps : "Apus"
    case .Aqr : "Aquarius"
    case .Aql : "Aquila"
    case .Ara : "Ara"
    case .Ari : "Aries"
    case .Aur : "Auriga"
    case .Boo : "Boötes"
    case .Cae : "Caelum"
    case .Cam : "Camelopardus"
    case .Cap : "Capricornus"
    case .Car : "Carina"
    case .Cas : "Cassiopeia"
    case .Cen : "Centaurus"
    case .Cep : "Cepheus"
    case .Cet : "Cetus"
    case .Cha : "Chamaeleon"
    case .Cir : "Circinus"
    case .CMa : "Canis Major"
    case .CMi : "Canis Minor"
    case .Cnc : "Cancer"
    case .Col : "Columba"
    case .Com : "Coma Berenice"
    case .CrA : "Corona Australis"
    case .CrB : "Corona Borealis"
    case .Crt : "Crater"
    case .Cru : "Crux"
    case .Crv : "Corvus"
    case .CVn : "Canes Venatici"
    case .Cyg : "Cygnus"
    case .Del : "Delphinus"
    case .Dor : "Dorado"
    case .Dra : "Draco"
    case .Equ : "Equuleus"
    case .Eri : "Eridanus"
    case .For : "Fornax"
    case .Gem : "Gemini"
    case .Gru : "Grus"
    case .Her : "Hercules"
    case .Hor : "Horologium"
    case .Hya : "Hydra"
    case .Hyi : "Hydrus"
    case .Ind : "Indus"
    case .Lac : "Lacerta"
    case .Leo : "Leo"
    case .Lep : "Lepus"
    case .Lib : "Libra"
    case .LMi : "Leo Minor"
    case .Lup : "Lupus"
    case .Lyn : "Lynx"
    case .Lyr : "Lyra"
    case .Men : "Mensa"
    case .Mic : "Microscopium"
    case .Mon : "Monoceros"
    case .Mus : "Musca"
    case .Nor : "Norma"
    case .Oct : "Octans"
    case .Oph : "Ophiuchus"
    case .Ori : "Orion"
    case .Pav : "Pavo"
    case .Peg : "Pegasus"
    case .Per : "Perseus"
    case .Phe : "Phoenix"
    case .Pic : "Pictor"
    case .PsA : "Piscis Austrinus"
    case .Psc : "Pisces"
    case .Pup : "Puppis"
    case .Pyx : "Pyxis"
    case .Ret : "Reticulum"
    case .Sco : "Scorpius"
    case .Scl : "Sculptor"
    case .Sct : "Scutum"
    case .Ser : "Serpens"
    case .Sex : "Sextans"
    case .Sge : "Sagitta"
    case .Sgr : "Sagittarius"
    case .Tau : "Taurus"
    case .Tel : "Telescopium"
    case .TrA : "Triangulum Australe"
    case .Tri : "Triangulum"
    case .Tuc : "Tucana"
    case .UMa : "Ursa Major"
    case .UMi : "Ursa Minor"
    case .Vel : "Vela"
    case .Vir : "Virgo"
    case .Vol : "Volans"
    case .Vul : "Vulpecula"
    }
  }
}
