// Project 1 of TreeHouse TechDegree
import GameplayKit

// The collection, a dictionary, to contain all players.
// The key of the dictionary is the player name in String type
// The value of the dictionary is an array of the first value being the height in inches, the second value being the soccer experience, the third value being the guardian name, all in String type.
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
    "Philip Helm": ["44", "YES", "Thomas Helm and Eva Jones"],
    "Les Clay": ["42", "YES", "Wynonna Brown"],
    "Herschel Krustofski": ["45", "YES", "Hyman and Rachel Krutoski"]
]

// The collection, also a dictionary, to store players in different team
var teamSharks: [String: [String]] = [:]
var teamDragon: [String: [String]] = [:]
var teamRaptors: [String: [String]] = [:]

// The function to read the height, experience and guardian information from a collection of players according to the player name.
// The height, experience and guardian information will be returned as a tuple.
func playerInformation(ofPlayerName name: String, inPlayers players: [String: [String]])
    -> (height: String, experience: String, guardian: String) {
    if let playerInformation = players[name] {
        return (playerInformation[0], playerInformation[1], playerInformation[2])
    } else {
        return ("N/A", "N/A", "N/A")
    }
}

// The function to calculate average height of players in a collection
func averageHeight(players: [String: [String]]) -> Double {
    var heightTotal: Double = 0

    for player in players {
        if let height = Double(playerInformation(ofPlayerName: player.key, inPlayers: players).height) {
            heightTotal += height
        }
    }
    
    return heightTotal/Double(players.count)
}

// Function to assign a player to a team usign the player name as the key. The value of the player will be gotten from the players collection.
func assignPlayer(ofPlayerName player: String, intoTeam team: String) {
    switch team {
        case "Dragon": teamDragon[player] = [playerInformation(ofPlayerName: player, inPlayers: players).height, playerInformation(ofPlayerName: player, inPlayers: players).experience, playerInformation(ofPlayerName: player, inPlayers: players).guardian]
        case "Sharks": teamSharks[player] = [playerInformation(ofPlayerName: player, inPlayers: players).height, playerInformation(ofPlayerName: player, inPlayers: players).experience, playerInformation(ofPlayerName: player, inPlayers: players).guardian]
        case "Raptors": teamRaptors[player] = [playerInformation(ofPlayerName: player, inPlayers: players).height, playerInformation(ofPlayerName: player, inPlayers: players).experience, playerInformation(ofPlayerName: player, inPlayers: players).guardian]
        default: print("No such team. Error.")
    }
}

// The function to sort players into the three teams by their experience and height
func sortPlayersIntoThreeTeams(players: [String: [String]]) {
    // The two arrays below will used as temporary place to divide players into two groups: with experience or without experience
    // Only the name of the player will be stored in the two arrays
    var playersWithExperience: [String] = []
    var playersWithOutExperience: [String] = []
    // The variable will be used to indicate whether all teams' average heights are within 1.5 inches of each other
    // The initial value will be false
    // If the criteria could not be met, the assignment logic will run again until the criteria could be met.
    var heightRequirementOK = false
    
    // Players will be tried to be assigned into the three teams so that they will have even experienced player.
    // And, all teams' average heights are within 1.5 inches of each other, otherwise, the assignment logic will loop again.
    while heightRequirementOK == false {
        // To remove any previous data in the collections to be used to prevent from unexpected error
        teamDragon.removeAll()
        teamSharks.removeAll()
        teamRaptors.removeAll()
        playersWithExperience.removeAll()
        playersWithOutExperience.removeAll()
        
        // Divide players into two groups: with experience or without experience
        for player in players {
            switch playerInformation(ofPlayerName: player.key, inPlayers: players).experience {
                case "YES": playersWithExperience.append(player.key)
                case "NO": playersWithOutExperience.append(player.key)
                default: print("Error! No information about his/her soccer found. Please check again the players collection.")
            }
        }
        
        // Variables used to store random number to assign player into team randomly
        var randomTeam1 = 1
        var randomTeam2 = 2
        var randomTeam3 = 3
        
        // Assign players with experience into the three teams first
        while playersWithExperience.count > 0 {
            // To ensure the three teams to have even experienced players.
            // For each loop, three players will be drawn out from the array randomly, and evenly put into the three teams.
            
            // Pick out a random player and place him/her into one of the three teams, remove it from the temporary array then
            let randomPlayer1 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
            randomTeam1 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
            
            switch randomTeam1 {
                case 0: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer1], intoTeam: "Dragon")
                case 1: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer1], intoTeam: "Sharks")
                case 2: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer1], intoTeam: "Raptors")
                default: print("Unexpected error")
            }
            
            playersWithExperience.remove(at: randomPlayer1)
            
            if playersWithExperience.count > 0 {
                // Pick out another random player and place him/her into the other two teams, remove it from the temporary array then
                let randomPlayer2 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
                randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while randomTeam2 == randomTeam1 {
                    randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam2 {
                    case 0: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer2], intoTeam: "Dragon")
                    case 1: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer2], intoTeam: "Sharks")
                    case 2: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer2], intoTeam: "Raptors")
                    default: print("Unexpected error")
                }
            
                playersWithExperience.remove(at: randomPlayer2)
            }
            
            if playersWithExperience.count > 0 {
                // Pick out a random player again and place him/her into the last team, remove it from the temporary array then
                let randomPlayer3 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
                randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while (randomTeam3 == randomTeam1 || randomTeam3 == randomTeam2) {
                    randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam3 {
                    case 0: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer3], intoTeam: "Dragon")
                    case 1: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer3], intoTeam: "Sharks")
                    case 2: assignPlayer(ofPlayerName: playersWithExperience[randomPlayer3], intoTeam: "Raptors")
                    default: print("Unexpected error")
                }
            
                playersWithExperience.remove(at: randomPlayer3)
            }
        }
        
        // Assign players without experience into the three teams then
        while playersWithOutExperience.count > 0 {
            // To ensure the three teams to have even experienced players.
            // For each loop, three players will be drawn out from the array randomly, and evenly put into the three teams.
            
            // Pick out a random player and place him/her into one of the three teams, remove it from the temporary array then
            let randomPlayer1 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
            randomTeam1 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
            
            switch randomTeam1 {
                case 0: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer1], intoTeam: "Dragon")
                case 1: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer1], intoTeam: "Sharks")
                case 2: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer1], intoTeam: "Raptors")
                default: print("Unexpected error")
            }
            
            playersWithOutExperience.remove(at: randomPlayer1)
            
            if playersWithOutExperience.count > 0 {
                // Pick out another random player and place him/her into the other two teams, remove it from the temporary array then
                let randomPlayer2 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
                randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while randomTeam2 == randomTeam1 {
                    randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
        
                switch randomTeam2 {
                    case 0: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer2], intoTeam: "Dragon")
                    case 1: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer2], intoTeam: "Sharks")
                    case 2: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer2], intoTeam: "Raptors")
                    default: print("Unexpected error")
                }
            
                playersWithOutExperience.remove(at: randomPlayer2)
            }
            
            if playersWithOutExperience.count > 0 {
                // Pick out a random player again and place him/her into the last team, remove it from the temporary array then
                let randomPlayer3 = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
                randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while (randomTeam3 == randomTeam1 || randomTeam3 == randomTeam2) {
                    randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam3 {
                    case 0: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer3], intoTeam: "Dragon")
                    case 1: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer3], intoTeam: "Sharks")
                    case 2: assignPlayer(ofPlayerName: playersWithOutExperience[randomPlayer3], intoTeam: "Raptors")
                    default: print("Unexpected error")
                }
            
                playersWithOutExperience.remove(at: randomPlayer3)
            }
        }
        
        // To check whether all teams' average heights are within 1.5 inches of each other
        // If the criteria could be met, the assignment logic will end.
        // Otherwise, players will be picked into the three teams again by random assignment until the criteria could be met.
        // As such, the criteria will be met by trial and error.
        // For each time of assignment, the three teams will have even experienced players.
        if (averageHeight(players: teamDragon)-averageHeight(players: teamSharks)<1.5 &&
            averageHeight(players: teamSharks)-averageHeight(players: teamRaptors)<1.5 &&
            averageHeight(players: teamRaptors)-averageHeight(players: teamDragon)<1.5) {
            heightRequirementOK = true
        }
    }
}

// Run the function to sort player in players into the three teams
sortPlayersIntoThreeTeams(players: players)

// Variables to store the letters to guardian
var letters: [String] = []

// To produce and save the letter into the letters collection
for player in teamDragon {
    letters.append("Dear \(playerInformation(ofPlayerName: player.key, inPlayers: teamDragon).guardian),\nI would like to inform you that your child, named \(player.key), has been put into the Team Dragon. Please arrange your child to attend the training on March 17, 1pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}
for player in teamSharks {
    letters.append("Dear \(playerInformation(ofPlayerName: player.key, inPlayers: teamSharks).guardian),\nI would like to inform you that your child, named \(player.key), has been put into the Team Sharks. Please arrange your child to attend the training on March 17, 3pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}
for player in teamRaptors {
    letters.append("Dear \(playerInformation(ofPlayerName: player.key, inPlayers: teamRaptors).guardian),\nI would like to inform you that your child, named \(player.key), has been put into the Team Raptors. Please arrange your child to attend the training on March 18, 1pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}

// Print out the letter to the console
for letter in letters {
    print(letter)
    print("=====================")
}

// Print out average height of each team
print("Average height of team Dragon = \(averageHeight(players: teamDragon))")
print("Average height of team Sharks = \(averageHeight(players: teamSharks))")
print("Average height of team Raptors = \(averageHeight(players: teamRaptors))")

// Project 1 Complele