import UIKit

struct Song {
    let songTitle: String
    let artist: String
    let durationTime: Int
    let coverImage: String
    let fileName: String
}

var arrayOfSongs: [Song] = [
    Song(songTitle: "Change (In the House of Flies)", artist: "Deftones", durationTime: 307, coverImage: "DeftonesChange", fileName: "deftones_change"),
    Song(songTitle: "Светлая полоса", artist: "Noize MC", durationTime: 284, coverImage: "noizeMcSvetlayaPolosa", fileName: "noize_mc_svetlaya_polosa"),
    Song(songTitle: "Ma Meilleure Ennemie", artist: "Stromae feat. Pomme & Coldplay", durationTime: 242, coverImage: "MaMeilleureEnnemie", fileName: "stromae_ma_meilleure_ennemie"),
    Song(songTitle: "Let It Go", artist: "The Neighbourhood", durationTime: 261, coverImage: "LetItGo", fileName: "neighbourhood_let_it_go"),
    Song(songTitle: "The Line", artist: "Twenty One Pilots", durationTime: 202, coverImage: "TheLine", fileName: "twenty_one_pilots_the_line")
]
