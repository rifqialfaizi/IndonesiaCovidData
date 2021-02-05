//
//  Covid.swift
//  FetchJSONCovid
//
//  Created by Rifqi Alfaizi on 04/02/21.
//

import Foundation
import SwiftUI

// karena di dalam JSON di dalam Update ada Total, maka harus buat folder dalamnya, tapi buatnya di atas. jumlah_itu ada di dalam Total, Total ada di dalam Update, Update diperlukan di CovidResponse.


struct Total : Codable, Identifiable {
    let id = UUID()
    let jumlah_positif : Int
    let jumlah_dirawat : Int
    let jumlah_sembuh : Int
    let jumlah_meninggal : Int
}

struct Update : Codable {
    let total : Total
}

struct CovidResponse : Codable {
    var update : Update
}
