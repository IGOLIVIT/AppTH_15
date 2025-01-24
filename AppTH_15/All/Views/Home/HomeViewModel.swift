//
//  HomeViewModel.swift
//  AppTH_15
//
//  Created by IGOR on 22/01/2025.
//

import SwiftUI
import CoreData
import Combine

final class HomeViewModel: ObservableObject {
    
    @AppStorage("Photo") var Photo: String = ""
    @AppStorage("Name") var Name: String = ""

    @AppStorage("numGames") var numGames: String = ""
    @AppStorage("numWins") var numWins: String = ""
    @AppStorage("numScore") var numScore: String = ""
    
    @Published var addName: String = ""
    @Published var addNG: String = ""
    @Published var addNW: String = ""
    @Published var addNS: String = ""

    @Published var types: [String] = ["Playing", "Completed", "Just created"]
    @Published var curType = "Playing"
    
    @Published var imPlayers: [String] = ["boy1", "boy2", "girl1", "girl2"]
    @Published var currentImPlayer = ""
    
    @Published var bgs: [String] = ["bg1", "bg2", "bg3", "bg4", "bg5", "bg6"]
    @Published var curBg = ""
        
    @Published var genders: [String] = ["Male", "Female"]
    @Published var selGen = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isEditProfile: Bool = false
    @Published var isProfile: Bool = false

    @Published var gName: String = ""
    @Published var gIm: String = ""
    @Published var gDescr: String = ""
    @Published var gType: String = ""

    @Published var games: [GameModel] = []
    @Published var selectedGame: GameModel?

    func addGame() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GameModel", into: context) as! GameModel

        loan.gName = gName
        loan.gIm = gIm
        loan.gDescr = gDescr
        loan.gType = gType

        CoreDataStack.shared.saveContext()
    }

    func fetchGames() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameModel>(entityName: "GameModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.games = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.games = []
        }
    }
    
    @Published var plName: String = ""
    @Published var plIm: String = ""
    @Published var plWin: String = ""
    @Published var plGame: String = ""
    @Published var plNewWin: String = ""

    @Published var players: [PlayerModel] = []
    @Published var selectedPlayer: PlayerModel?

    func addPlayer() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context) as! PlayerModel

        loan.plName = plName
        loan.plIm = plIm
        loan.plWin = plWin
        loan.plGame = plGame
        loan.plNewWin = plNewWin

        CoreDataStack.shared.saveContext()
    }

    func fetchPlayers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayerModel>(entityName: "PlayerModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.players = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.players = []
        }
    }
 
    @Published var remainingTime: Int
    @Published var isRunning = false
    private var timer: AnyCancellable?
    let initialTime: Int = 15 * 60  // 15 минут в секундах

    init() {
        self.remainingTime = initialTime
    }

    func start() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    func stop() {
        isRunning = false
        timer?.cancel()
    }

    func finish() {
        stop()
        remainingTime = 0
    }

    func reset() {
        stop()
        remainingTime = initialTime
    }

    private func tick() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            finish()
        }
    }
}
