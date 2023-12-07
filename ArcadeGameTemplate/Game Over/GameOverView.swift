//
//  GameOverView.swift
//  ArcadeGameTemplate
//

import SwiftUI

/**
 * # GameOverView
 *   This view is responsible for showing the game over state of the game.
 *  Currently it only present buttons to take the player back to the main screen or restart the game.
 *
 *  You can also present score of the player, present any kind of achievements or rewards the player
 *  might have accomplished during the game session, etc...
 **/

struct GameOverView: View {
    
    @Binding var currentGameState: GameState
    // @Binding var score: Int <-- Pass value
    //@State private var score: Int = 64
    
    var body: some View {
        ZStack {
            
            Image("flappy3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                VStack{
                    
                    Text("Game Over!")
                        .font(.custom("PixelifySans-SemiBold", size: 60, relativeTo: .title2))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.black)
                        .overlay(
                            Text("Game Over!")
                                .font(.custom("PixelifySans-SemiBold", size: 60, relativeTo: .title2))
                                .minimumScaleFactor(0.5)
                                .foregroundStyle(.white)
                                .offset(x: 2, y: -2) // Offset to simulate character stroke
                        )
                        .padding(.bottom, -2)
                    
                    HStack{
                        Text("Score:")
                            .font(.custom("PixelifySans-SemiBold", size: 40, relativeTo: .title3))
                            .minimumScaleFactor(0.5)
                            .foregroundStyle(.black)
                            .overlay(
                                Text("Score:")
                                    .font(.custom("PixelifySans-SemiBold", size: 40, relativeTo: .title3))
                                    .minimumScaleFactor(0.5)
                                    .foregroundStyle(.white)
                                    .offset(x: 2, y: -2) // Offset to simulate character stroke
                            )
                        
                        Image("Cow")
                            .resizable()
                            .frame(width: 85, height: 85)
                        
                        Text("x64")
                            .font(.custom("PixelifySans-SemiBold", size: 35, relativeTo: .title3))
                            .minimumScaleFactor(0.5)
                            .foregroundStyle(.black)
                            .offset(x:-40, y: 16)
                            .rotationEffect(.degrees(15))
                            .overlay(
                                Text("x64")
                                    .font(.custom("PixelifySans-SemiBold", size: 35, relativeTo: .title3))
                                    .minimumScaleFactor(0.5)
                                    .foregroundStyle(.white)
                                    .rotationEffect(.degrees(15))
                                    .offset(x: -40, y: 6) // Offset to simulate character stroke
                            )
                    }
                    .offset(x: 20)
                }
                .offset(y: -60)
                
                
                HStack(spacing: 150){
                    Button {
                        withAnimation { self.backToMainScreen() }
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .background(Circle().foregroundStyle(.ultraThinMaterial.opacity(0.8)).frame(width: 100, height: 100, alignment: .center))
     
                    
                    Button {
                        withAnimation { self.restartGame() }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .background(Circle().foregroundStyle(.ultraThinMaterial.opacity(0.8)).frame(width: 100, height: 100, alignment: .center))
                    
                }
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
    
    private func backToMainScreen() {
        self.currentGameState = .mainScreen
    }
    
    private func restartGame() {
        self.currentGameState = .playing
    }
}

#Preview {
    GameOverView(currentGameState: .constant(GameState.gameOver))
}
