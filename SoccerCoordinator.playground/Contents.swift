// The collection, a dictionary, to contain all information for all 18 players
// The key of the dictionary is the player name
// The value of the dictionary is an array of the first value being the height in inches, the second being the soccer experience, the third value being the guardian name
var players: [String: [String]] = [
    "Joe Smith": ["42", "YES", "Jim and Jan Smith"],
    "Jill Tanner": ["36", "YES", "Clara Tanner"],
    "BIll Bon": ["43", "YES", "Sara and Jeny Bon"],
    "Eva Gordon": ["45", "NO", "Wendy and Mike Gordon"],
    "Matt Gill": ["40", "NO", "Charles an Sylvia Gill"],
    "Kimmy Stein": ["41", "NO", "BIll and Hillary Stein"],
    "Sammy Adams": ["45", "NO", "Jeff Adams"],
    "Karl Saygan": ["42", "YES", "Heather Bledsoe"],
    "Suzane Greenberg": ["44", "YES", "Henrietta Dumas"],
    "Sal Dali": ["41", "NO", "Gala Dali"],
    "Joe Kavalier": ["39", "NO", "Sam and Elaine Kavalier"],
    "Ben Finkelstein": ["44", "NO", "Aaron and Jill Finkelstein"],
    "Diego Soto": ["41", "YES", "Robin and Sarika Soto"],
    "Chloe Alaska": ["47", "NO", "David and Jamie Alaska"],
    "Arnold Willis": ["43", "NO", "Chaire Willis"],
    "Philip Helm": ["44"," YES", "Thomas Helm and Eva Jones"],
    "Les Clay": ["42", "YES", "Wynonna Brown"],
    "Herschel Krustofski": ["45", "YES", "Hyman and Rachel Krutoski"]
]

print(players.count)

Int((players["Matt Gill"]?[0])!)

// The function to get the height, experience and guardian information of a player by the player name
func playerInformation(ofPlayerName name: String)
    -> (height: Double, experience: String, guardian: String) {
    if let playerInformation = players[name] {
        return (Double(playerInformation[0])!, playerInformation[1], playerInformation[2])
    } else {
        return (0, "", "")
    }
}

playerInformation(ofPlayerName: "Diego Soto")
playerInformation(ofPlayerName: "Les Clay")
playerInformation(ofPlayerName: "Benson")

// The collection to store players for each team
var teamSharks: [String: [String]] = [:]
var teamDragon: [String: [String]] = [:]
var teamRaptors: [String: [String]] = [:]

func averageHeight(players: [String: [String]]) -> Double {
    var playerHeightArray: [Double] = []
    
    for player in players {
        print(player.key)
        playerHeightArray.append(playerInformation(ofPlayerName: player.key).height)
    }
    
    print(playerHeightArray)
    
    var heightTotal: Double = 0
    for height in playerHeightArray {
        heightTotal += height
    }
    
    return heightTotal/Double(playerHeightArray.count)
}

averageHeight(players: players)











