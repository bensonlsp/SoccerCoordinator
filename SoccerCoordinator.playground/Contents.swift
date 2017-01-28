// Project 1 of TreeHouse TechDegree
// import GameplayKit
import GameplayKit

// The array to contain all players is called players. Each player will be stored as a dictionary.
let player0: [String: Any] = ["name": "Joe Smith", "height": 42.0, "experience": true, "guardian": "Jim and Jan Smith"]
let player1: [String: Any] = ["name": "Jill Tanner", "height": 36.0, "experience": true, "guardian": "Clara Tanner"]
let player2: [String: Any] = ["name": "BIll Bon", "height": 43.0, "experience": true, "guardian": "Sara and Jeny Bon"]
let player3: [String: Any] = ["name": "Eva Gordon", "height": 45.0, "experience": false, "guardian": "Wendy and Mike Gordon"]

let player4: [String: Any] = ["name": "Matt Gill", "height": 40.0, "experience": false, "guardian": "Charles an Sylvia Gill"]
let player5: [String: Any] = ["name": "Kimmy Stein", "height": 41.0, "experience": false, "guardian":  "BIll and Hillary Stein"]
let player6: [String: Any] = ["name": "Sammy Adams", "height": 45.0, "experience": false, "guardian": "Jeff Adams"]
let player7: [String: Any] = ["name": "Karl Saygan", "height": 42.0, "experience": true, "guardian": "Heather Bledsoe"]

let player8: [String: Any] = ["name": "Suzane Greenberg", "height": 44.0, "experience": true, "guardian": "Henrietta Dumas"]
let player9: [String: Any] = ["name": "Sal Dali", "height": 41.0, "experience": false, "guardian": "Gala Dali"]
let player10: [String: Any] = ["name": "Joe Kavalier", "height": 39.0, "experience": false, "guardian": "Sam and Elaine Kavalier"]
let player11: [String: Any] = ["name": "Ben Finkelstein", "height": 44.0, "experience": false, "guardian": "Aaron and Jill Finkelstein"]

let player12: [String: Any] = ["name": "Diego Soto", "height": 41.0, "experience": true, "guardian": "Robin and Sarika Soto"]
let player13: [String: Any] = ["name": "Chloe Alaska", "height": 47.0, "experience": false, "guardian": "David and Jamie Alaska"]
let player14: [String: Any] = ["name": "Arnold Willis", "height": 43.0, "experience": false, "guardian": "Chaire Willis"]
let player15: [String: Any] = ["name": "Philip Helm", "height": 44.0, "experience": true, "guardian": "Thomas Helm and Eva Jones"]

let player16: [String: Any] = ["name": "Les Clay", "height": 42.0, "experience": true, "guardian": "Wynonna Brown"]
let player17: [String: Any] = ["name": "Herschel Krustofski", "height": 45.0, "experience": true, "guardian": "Hyman and Rachel Krutoski"]

var players: [[String:Any]] = [player0, player1, player2, player3, player4, player5, player6, player7, player8, player9,
    player10, player11, player12, player13, player14, player15, player16, player17]

// The arrays to store players in different teams
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

// The function to calculate average height of players in an array
func averageHeight(players:  [[String: Any]]) -> Double {
    var heightTotal: Double = 0

    for player in players {
        if let playerHeight = player["height"] {
            heightTotal += playerHeight as! Double
        }
    }
    
    return heightTotal/Double(players.count)
}

// The function to sort players into the three teams by their experience and height
func sortPlayersIntoThreeTeams(fromPlayers players: [[String: Any]]) {
    // The two arrays below will used as temporary place to divide players into two groups: with experience or without experience
    var playersWithExperience: [[String: Any]] = []
    var playersWithOutExperience: [[String: Any]] = []
    // The variable will be used to indicate whether all teams' average heights are within 1.5 inches of each other
    // The initial value will be false
    // If the criteria could not be met, the assignment logic will run again until the criteria could be met.
    var heightRequirementOK = false
    
    // Players will be tried to be assigned into the three teams so that they will have even experienced player.
    // And, all teams' average heights will be ensured to be within 1.5 inches of each other, otherwise, the assignment logic will loop again.
    while heightRequirementOK == false {
        // To remove and reset any previous data in the collections to be used to prevent from unexpected error
        teamDragons.removeAll()
        teamSharks.removeAll()
        teamRaptors.removeAll()
        playersWithExperience.removeAll()
        playersWithOutExperience.removeAll()
        
        // Divide players into two groups: with experience or without experience
        for player in players {
            if (player["experience"] as! Bool) == true {
                playersWithExperience.append(player)
            } else if (player["experience"] as! Bool) == false {
                playersWithOutExperience.append(player)
            } else {
                print("Unexpected erro!")
            }
        }
        
        // Variables used to store random number for assignment of player into the three teams randomly
        var randomTeam1: Int = 1
        var randomTeam2: Int = 2
        var randomTeam3: Int = 3
        
        // Assign players with experience into the three teams first
        while playersWithExperience.count > 0 {
            // To ensure the three teams to have even experienced players.
            // For each loop, three players will be drawn out from the array randomly, and evenly put into the three teams.
            
            // Pick out a random player and place him/her into one of the three teams, remove it from the temporary array then
            let randomPlayer1: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
            randomTeam1 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
            
            switch randomTeam1 {
            case 0: teamDragons.append(playersWithExperience[randomPlayer1])
            case 1: teamSharks.append(playersWithExperience[randomPlayer1])
            case 2: teamRaptors.append(playersWithExperience[randomPlayer1])
            default: print("Unexpected error")
            }
            
            playersWithExperience.remove(at: randomPlayer1)
            
            if playersWithExperience.count > 0 {
                // Pick out another random player and place him/her into the other two teams, remove it from the temporary array then
                let randomPlayer2: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
                randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while randomTeam2 == randomTeam1 {
                    randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam2 {
                case 0: teamDragons.append(playersWithExperience[randomPlayer2])
                case 1: teamSharks.append(playersWithExperience[randomPlayer2])
                case 2: teamRaptors.append(playersWithExperience[randomPlayer2])
                default: print("Unexpected error")
                }
            
                playersWithExperience.remove(at: randomPlayer2)
            }
            
            if playersWithExperience.count > 0 {
                // Pick out a random player again and place him/her into the last team, remove it from the temporary array then
                let randomPlayer3: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithExperience.count)
            
                randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while (randomTeam3 == randomTeam1 || randomTeam3 == randomTeam2) {
                    randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam3 {
                case 0: teamDragons.append(playersWithExperience[randomPlayer3])
                case 1: teamSharks.append(playersWithExperience[randomPlayer3])
                case 2: teamRaptors.append(playersWithExperience[randomPlayer3])
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
            let randomPlayer1: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
            randomTeam1 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
            
            switch randomTeam1 {
            case 0: teamDragons.append(playersWithOutExperience[randomPlayer1])
            case 1: teamSharks.append(playersWithOutExperience[randomPlayer1])
            case 2: teamRaptors.append(playersWithOutExperience[randomPlayer1])
            default: print("Unexpected error")
            }
            
            playersWithOutExperience.remove(at: randomPlayer1)
            
            if playersWithOutExperience.count > 0 {
                // Pick out another random player and place him/her into the other two teams, remove it from the temporary array then
                let randomPlayer2: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
                randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while randomTeam2 == randomTeam1 {
                    randomTeam2 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
        
                switch randomTeam2 {
                case 0: teamDragons.append(playersWithOutExperience[randomPlayer2])
                case 1: teamSharks.append(playersWithOutExperience[randomPlayer2])
                case 2: teamRaptors.append(playersWithOutExperience[randomPlayer2])
                default: print("Unexpected error")
                }
            
                playersWithOutExperience.remove(at: randomPlayer2)
            }
            
            if playersWithOutExperience.count > 0 {
                // Pick out a random player again and place him/her into the last team, remove it from the temporary array then
                let randomPlayer3: Int = GKRandomSource.sharedRandom().nextInt(upperBound: playersWithOutExperience.count)
            
                randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                while (randomTeam3 == randomTeam1 || randomTeam3 == randomTeam2) {
                    randomTeam3 = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                }
            
                switch randomTeam3 {
                case 0: teamDragons.append(playersWithOutExperience[randomPlayer3])
                case 1: teamSharks.append(playersWithOutExperience[randomPlayer3])
                case 2: teamRaptors.append(playersWithOutExperience[randomPlayer3])
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
        if (abs(averageHeight(players: teamDragons)-averageHeight(players: teamSharks))<1.5 &&
            abs(averageHeight(players: teamSharks)-averageHeight(players: teamRaptors))<1.5 &&
            abs(averageHeight(players: teamRaptors)-averageHeight(players: teamDragons))<1.5) {
            heightRequirementOK = true
        }
    }
}

// Run the function to sort player in players into the three teams
sortPlayersIntoThreeTeams(fromPlayers: players)

// Variables to store the letters to guardian
var letters: [String] = []

// To produce and save the letter into the letters collection
for player in teamDragons {
    let guardian = player["guardian"] as! String
    let name = player["name"] as! String
    letters.append("Dear \(guardian),\nI would like to inform you that your child, named \(name), has been put into the Team Dragons. Please arrange your child to attend the training on March 17, 1pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}
for player in teamSharks {
    let guardian = player["guardian"] as! String
    let name = player["name"] as! String
    letters.append("Dear \(guardian),\nI would like to inform you that your child, named \(name), has been put into the Team Sharks. Please arrange your child to attend the training on March 17, 3pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}
for player in teamRaptors {
    let guardian = player["guardian"] as! String
    let name = player["name"] as! String
    letters.append("Dear \(guardian),\nI would like to inform you that your child, named \(name), has been put into the Team Raptors. Please arrange your child to attend the training on March 18, 1pm. Thank you very much.\nFrom: TreeHouse Soccer.")
}

// Print out the letter to the console
for letter in letters {
    print(letter)
    print("=====================")
}

// Print out average height of each team
print("Average height of team Dragons = \(averageHeight(players: teamDragons))")
print("Average height of team Sharks = \(averageHeight(players: teamSharks))")
print("Average height of team Raptors = \(averageHeight(players: teamRaptors))")

// Project 1 Complele