//
//  ConversionRate.swift
//  Sterling
//
//  Created by Owen Henley on 11/04/2023.
//

import Foundation

struct ConversionRate: Decodable, Hashable {
    let gbp: Double
    let aed: Double
    let afn: Double
    let all: Double
    let amd: Double
    let ang: Double
    let aoa: Double
    let ars: Double
    let aud: Double
    let awg: Double
    let azn: Double
    let bam: Double
    let bbd: Double
    let bdt: Double
    let bgn: Double
    let bhd: Double
    let bif: Double
    let bmd: Double
    let bnd: Double
    let bob: Double
    let brl: Double
    let bsd: Double
    let btn: Double
    let bwp: Double
    let byn: Double
    let bzd: Double
    let cad: Double
    let cdf: Double
    let chf: Double
    let clp: Double
    let cny: Double
    let cop: Double
    let crc: Double
    let cup: Double
    let cve: Double
    let czk: Double
    let djf: Double
    let dkk: Double
    let dop: Double
    let dzd: Double
    let egp: Double
    let ern: Double
    let etb: Double
    let eur: Double
    let fjd: Double
    let fkp: Double
    let fok: Double
    let gel: Double
    let ggp: Double
    let ghs: Double
    let gip: Double
    let gmd: Double
    let gnf: Double
    let gtq: Double
    let gyd: Double
    let hkd: Double
    let hnl: Double
    let hrk: Double
    let htg: Double
    let huf: Double
    let idr: Double
    let ils: Double
    let imp: Double
    let inr: Double
    let iqd: Double
    let irr: Double
    let isk: Double
    let jep: Double
    let jmd: Double
    let jod: Double
    let jpy: Double
    let kes: Double
    let kgs: Double
    let khr: Double
    let kid: Double
    let kmf: Double
    let krw: Double
    let kwd: Double
    let kyd: Double
    let kzt: Double
    let lak: Double
    let lbp: Double
    let lkr: Double
    let lrd: Double
    let lsl: Double
    let lyd: Double
    let mad: Double
    let mdl: Double
    let mga: Double
    let mkd: Double
    let mmk: Double
    let mnt: Double
    let mop: Double
    let mru: Double
    let mur: Double
    let mvr: Double
    let mwk: Double
    let mxn: Double
    let myr: Double
    let mzn: Double
    let nad: Double
    let ngn: Double
    let nio: Double
    let nok: Double
    let npr: Double
    let nzd: Double
    let omr: Double
    let pab: Double
    let pen: Double
    let pgk: Double
    let php: Double
    let pkr: Double
    let pln: Double
    let pyg: Double
    let qar: Double
    let ron: Double
    let rsd: Double
    let rub: Double
    let rwf: Double
    let sar: Double
    let sbd: Double
    let scr: Double
    let sdg: Double
    let sek: Double
    let sgd: Double
    let shp: Double
    let sle: Double
    let sll: Double
    let sos: Double
    let srd: Double
    let ssp: Double
    let stn: Double
    let syp: Double
    let szl: Double
    let thb: Double
    let tjs: Double
    let tmt: Double
    let tnd: Double
    let top: Double
    let `try`: Double
    let ttd: Double
    let tvd: Double
    let twd: Double
    let tzs: Double
    let uah: Double
    let ugx: Double
    let usd: Double
    let uyu: Double
    let uzs: Double
    let ves: Double
    let vnd: Double
    let vuv: Double
    let wst: Double
    let xaf: Double
    let xcd: Double
    let xdr: Double
    let xof: Double
    let xpf: Double
    let yer: Double
    let zar: Double
    let zmw: Double
    let zwl: Double
    // Add more currencies and coding key

    enum CodingKeys: String, CodingKey {
        case gbp = "GBP"
        case aed = "AED"
        case afn = "AFN"
        case all = "ALL"
        case amd = "AMD"
        case ang = "ANG"
        case aoa = "AOA"
        case ars = "ARS"
        case aud = "AUD"
        case awg = "AWG"
        case azn = "AZN"
        case bam = "BAM"
        case bbd = "BBD"
        case bdt = "BDT"
        case bgn = "BGN"
        case bhd = "BHD"
        case bif = "BIF"
        case bmd = "BMD"
        case bnd = "BND"
        case bob = "BOB"
        case brl = "BRL"
        case bsd = "BSD"
        case btn = "BTN"
        case bwp = "BWP"
        case byn = "BYN"
        case bzd = "BZD"
        case cad = "CAD"
        case cdf = "CDF"
        case chf = "CHF"
        case clp = "CLP"
        case cny = "CNY"
        case cop = "COP"
        case crc = "CRC"
        case cup = "CUP"
        case cve = "CVE"
        case czk = "CZK"
        case djf = "DJF"
        case dkk = "DKK"
        case dop = "DOP"
        case dzd = "DZD"
        case egp = "EGP"
        case ern = "ERN"
        case etb = "ETB"
        case eur = "EUR"
        case fjd = "FJD"
        case fkp = "FKP"
        case fok = "FOK"
        case gel = "GEL"
        case ggp = "GGP"
        case ghs = "GHS"
        case gip = "GIP"
        case gmd = "GMD"
        case gnf = "GNF"
        case gtq = "GTQ"
        case gyd = "GYD"
        case hkd = "HKD"
        case hnl = "HNL"
        case hrk = "HRK"
        case htg = "HTG"
        case huf = "HUF"
        case idr = "IDR"
        case ils = "ILS"
        case imp = "IMP"
        case inr = "INR"
        case iqd = "IQD"
        case irr = "IRR"
        case isk = "ISK"
        case jep = "JEP"
        case jmd = "JMD"
        case jod = "JOD"
        case jpy = "JPY"
        case kes = "KES"
        case kgs = "KGS"
        case khr = "KHR"
        case kid = "KID"
        case kmf = "KMF"
        case krw = "KRW"
        case kwd = "KWD"
        case kyd = "KYD"
        case kzt = "KZT"
        case lak = "LAK"
        case lbp = "LBP"
        case lkr = "LKR"
        case lrd = "LRD"
        case lsl = "LSL"
        case lyd = "LYD"
        case mad = "MAD"
        case mdl = "MDL"
        case mga = "MGA"
        case mkd = "MKD"
        case mmk = "MMK"
        case mnt = "MNT"
        case mop = "MOP"
        case mru = "MRU"
        case mur = "MUR"
        case mvr = "MVR"
        case mwk = "MWK"
        case mxn = "MXN"
        case myr = "MYR"
        case mzn = "MZN"
        case nad = "NAD"
        case ngn = "NGN"
        case nio = "NIO"
        case nok = "NOK"
        case npr = "NPR"
        case nzd = "NZD"
        case omr = "OMR"
        case pab = "PAB"
        case pen = "PEN"
        case pgk = "PGK"
        case php = "PHP"
        case pkr = "PKR"
        case pln = "PLN"
        case pyg = "PYG"
        case qar = "QAR"
        case ron = "RON"
        case rsd = "RSD"
        case rub = "RUB"
        case rwf = "RWF"
        case sar = "SAR"
        case sbd = "SBD"
        case scr = "SCR"
        case sdg = "SDG"
        case sek = "SEK"
        case sgd = "SGD"
        case shp = "SHP"
        case sle = "SLE"
        case sll = "SLL"
        case sos = "SOS"
        case srd = "SRD"
        case ssp = "SSP"
        case stn = "STN"
        case syp = "SYP"
        case szl = "SZL"
        case thb = "THB"
        case tjs = "TJS"
        case tmt = "TMT"
        case tnd = "TND"
        case `top` = "TOP"
        case `try` = "TRY"
        case ttd = "TTD"
        case tvd = "TVD"
        case twd = "TWD"
        case tzs = "TZS"
        case uah = "UAH"
        case ugx = "UGX"
        case usd = "USD"
        case uyu = "UYU"
        case uzs = "UZS"
        case ves = "VES"
        case vnd = "VND"
        case vuv = "VUV"
        case wst = "WST"
        case xaf = "XAF"
        case xcd = "XCD"
        case xdr = "XDR"
        case xof = "XOF"
        case xpf = "XPF"
        case yer = "YER"
        case zar = "ZAR"
        case zmw = "ZMW"
        case zwl = "ZWL"
    }
}
