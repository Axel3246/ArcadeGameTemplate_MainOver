//
//  MainScreen.swift
//  ArcadeGameTemplate
//

import SwiftUI


/**
 * # MainScreenView
 *
 *   This view is responsible for presenting the game name, the game intructions and to start the game.
 *  - Customize it as much as you want.
 *  - Experiment with colors and effects on the interface
 *  - Adapt the "Insert a Coin Button" to the visual identity of your game
 **/

struct MainScreenView: View {
    
    // The game state is used to transition between the different states of the game
    @Binding var currentGameState: GameState
    
    // Change it on the Constants.swift file
    var gameTitle: String = MainScreenProperties.gameTitle
    
    // Change it on the Constants.swift file
    var gameInstructions: [Instruction] = MainScreenProperties.gameInstructions
    
    // Change it on the Constants.swift file
    let accentColor: Color = MainScreenProperties.accentColor
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 16.0) {
               
                // MARK: - Scoreboard & Tutorial Action Buttons
                HStack(spacing: 120){
                    
                    Button{
                        // TODO: Insert Action
                        print("Clicked How to Play")
                    } label:{
                        Text("How to play  \(Image(systemName: "info.circle.fill"))")
                           
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 30)
                            .foregroundStyle(.ultraThinMaterial.opacity(0.5)) // <- glass effect
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: -16)
                    .minimumScaleFactor(0.2) // <- If font gets bigger, multiply by 0.2 the scale
                    
                    // MARK: Scoreboard Button
                    Button{
                        // TODO: Insert Action
                        print("Clicked Leaderboard")
                    } label:{
                        Text("\(Image(systemName: "trophy.circle.fill"))  Scoreboard")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 30)
                            .foregroundStyle(.ultraThinMaterial.opacity(0.5))
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: 4)
                    .minimumScaleFactor(0.2)
                }
                .font(.custom("PixelifySans-SemiBold", size: 15, relativeTo: .body))
                .foregroundStyle(.white)
                .padding(.top, 50)
                                
                // MARK: - Game Name & Tap to Play
                
                Spacer()
                VStack{
                    Text("\(self.gameTitle)")
                        .font(.custom("PixelifySans-SemiBold", size: 60, relativeTo: .title2))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.black)
                        .overlay(
                            Text("\(self.gameTitle)")
                                .font(.custom("PixelifySans-SemiBold", size: 60, relativeTo: .title2))
                                .minimumScaleFactor(0.5)
                                .foregroundStyle(.white)
                                .offset(x: 2, y: -2) // Offset to simulate character stroke
                        )
                    
                    Text("Tap to play!")
                        .font(.custom("PixelifySans-SemiBold", size: 25, relativeTo: .title3))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.black)
                        .overlay(
                            Text("Tap to play!")
                                .font(.custom("PixelifySans-SemiBold", size: 25, relativeTo: .title3))
                                .minimumScaleFactor(0.5)
                                .foregroundStyle(.white)
                                .offset(x: 2, y: -2) // Offset to simulate character stroke
                        )
                }
                .offset(y: -130)

                // MARK: - Test Cow Images
                HStack{
                    ForEach(0..<2){_ in
                        Image("Cow")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaleEffect(x: -1, y: 1)
                            .padding(.horizontal, 10)
                    }
                    ForEach(0..<2){_ in
                        Image("Cow")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaleEffect(x: 1, y: 1)
                            .padding(.horizontal, 10)
                    }
                    
                }
                .offset(y: 145)
                
                Spacer()
                
                Text("Dive In Games \(Image(systemName: "c.circle"))")
                    .font(.custom("PixelifySans-SemiBold", size: 18, relativeTo: .title3))
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.black.opacity(0.8))
                    .offset(y: -35)
                
            }
            .padding()
            .statusBar(hidden: true)
        }
        .background(
            Image("flappy3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .overlay(
            Button(action: {
                withAnimation { self.startGame() }
            }) {
                // Empty view with transparent background
                Color.clear
                    .frame(width: 390, height: 550) // Adjust size as needed
            }
        )
    }
    /**
     * Function responsible to start the game.
     * It changes the current game state to present the view which houses the game scene.
     */
    private func startGame() {
        print("- Starting the game...")
        self.currentGameState = .playing
    }
}

#Preview {
    MainScreenView(currentGameState: .constant(GameState.mainScreen))
}
