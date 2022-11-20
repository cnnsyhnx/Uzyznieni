//
//  GameView.swift
//  Uzyznieni
//
//  Created by Can Seyhan on 19/11/2022.
//

import SwiftUI

struct GameFrameView: View {
    @State private var startPosition: CGPoint = .zero     //start position of swipe
    @State private var positions = [CGPoint(x: 0, y: 0)]  //array of snake's body position
    @State private var foodPosition = CGPoint(x: 0, y: 0)
    @State private var fatalPosition = CGPoint(x: 0, y: 0) //fatal position
    @State private var pearPosition = CGPoint(x: 0, y: 0)
    
    @State private var isStarted = true                   //started swipe?
    @State private var gameOver = false                   //for ending the game when the snake hits the screen borders
    @State private var score = 0
    
    @State private var direction = Direction.down         //the direction the snake is going to take
    
    let snakeSize: CGFloat = 12                           //snake size
    let timer = Timer.publish(every: 0.08, on: .main, in: .common).autoconnect() //to update the snake position every 0.1 sec
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1161897704, green: 0.1520919502, blue: 0.1818574071, alpha: 1)).ignoresSafeArea()
            
            ZStack {
                VStack {
                    HStack {
                        HStack {
                            Text("Score: ")
                                .font(.headline)
                            Text("\(score)")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            startGame()
                            
                        }, label: {
                            
                            Text("Restart")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .frame(width: 65, height: 30)
                                .background(Color.secondary)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        })
                    }.padding()
                    .foregroundColor(.white)
                    
                    Spacer()
                } //VStack of score and restart closes.
                
                ForEach(0..<positions.count, id: \.self) { index in
                    //MARK: - Snake
                    Circle()
                        .fill(Color.white)
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .frame(width: snakeSize * 1.08, height: snakeSize * 1.08)
                        .position(positions[index])
                }
                //MARK: - Food
                HStack {
                    VStack {
                        Image("banana").resizable()
                            .frame(width: snakeSize * 3, height: snakeSize * 2.88)
                        .position(foodPosition)
                    }
                }
                HStack {
                    VStack {
                        Image("pear").resizable()
                            .frame(width: snakeSize * 3, height: snakeSize * 2.88)
                        .position(pearPosition)
                    }
                }
                HStack {
                    VStack {
                        Image("meat").resizable()
                            .frame(width: snakeSize * 3, height: snakeSize * 2.88)
                        .position(fatalPosition)
                    }
                }
            }.onAppear {
                withAnimation(.easeInOut) {
                    foodPosition = changePosition()
                    positions[0] = changePosition()
                    fatalPosition = changePosition()
                    pearPosition = changePosition()
                }
            }
            
        } // Main ZStack closes.
        //MARK: - Alert
        .alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over"), message: Text("Your Score is: \(score)"), primaryButton: .default(Text("Dismiss"), action: {
                gameOver.toggle()
                isStarted.toggle()
                
            }), secondaryButton: .default(Text("Restart"), action: {
                startGame()
            }))
        }
        //MARK: - Gesture
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if isStarted {
                        withAnimation {
                            startPosition = gesture.location
                            isStarted.toggle()
                        }
                    }
                }
                .onEnded { gesture in
                    let xDist =  abs(gesture.location.x - startPosition.x)
                    let yDist =  abs(gesture.location.y - startPosition.y)
                    if startPosition.y <  gesture.location.y && yDist > xDist {
                        direction = Direction.down
                    }
                    else if startPosition.y >  gesture.location.y && yDist > xDist {
                        direction = Direction.up
                    }
                    else if startPosition.x > gesture.location.x && yDist < xDist {
                        direction = Direction.right
                    }
                    else if startPosition.x < gesture.location.x && yDist < xDist {
                        direction = Direction.left
                    }
                    isStarted.toggle()
                }
        )
        //MARK: - Time frequency
        .onReceive(timer) { _ in
            if !gameOver {
                withAnimation(.linear(duration: 0.08)) {
                    changeDirection()
                }
                if positions[0] == foodPosition {
                    withAnimation(.spring()) {
                        positions.append(positions[0])
                    }
                    foodPosition = changePosition()
                    fatalPosition = changePosition()
                    score += 1
                    
                }
                if positions[0] == pearPosition {
                    withAnimation(.spring()) {
                        positions.append(positions[0])
                    }
                    foodPosition = changePosition()
                    pearPosition = changePosition()
                    fatalPosition = changePosition()
                    score += 1
                    
                }
                if positions[0] == fatalPosition {
                    withAnimation(.spring()) {
                        positions.append(positions[0])
                    }
                    foodPosition = changePosition()
                    fatalPosition = changePosition()
                    pearPosition = changePosition()
                    gameOver.toggle()
                    
                }
            }
        }
    }
    
    let minX = UIScreen.main.bounds.minX 
    let maxX = UIScreen.main.bounds.maxX
    let minY = UIScreen.main.bounds.minY / 1.40
    let maxY = UIScreen.main.bounds.maxY / 1.40
    
    //MARK: - Random Positions
    func changePosition() -> CGPoint {
        let rows = Int(maxX / snakeSize)
        let columns = Int(maxY / snakeSize)
        
        let randomX = Int.random(in: 1..<rows) * Int(snakeSize)
        let randomY = Int.random(in: 1..<columns) * Int(snakeSize)
        
        let randomPosition = CGPoint(x: randomX, y: randomY)
        return randomPosition
    }
    
    //MARK: - Snakes Direction
    func changeDirection() {
        if positions[0].x < minX || positions[0].x > maxX && !gameOver {
            gameOver.toggle()
        } else if positions[0].y < minY || positions[0].y > maxY && !gameOver {
            gameOver.toggle()
        }
        
        var prev = positions[0]
        
        if direction == .down {
            positions[0].y += snakeSize
            
        } else if direction == .up {
            positions[0].y -= snakeSize
            
        } else if direction == .left {
            positions[0].x += snakeSize
            
        } else {
            positions[0].x -= snakeSize
        }
        
        
        for index in 1..<positions.count {
            let current = positions[index]
            positions[index] = prev
            
            prev = current
            
        }
    }
    
    //MARK: - Start Game
    func startGame() {
        withAnimation(.easeInOut) {
            score = 0
            positions = [CGPoint(x: 0, y: 0)]
            
            gameOver = false
            isStarted = true
            foodPosition = changePosition()
            fatalPosition = changePosition()
            positions[0] = changePosition()
            pearPosition = changePosition()
            changeDirection()
        }
        
    }
}

struct GameFrameView_Previews: PreviewProvider {
    static var previews: some View {
        GameFrameView().frame(maxWidth: 400,maxHeight: 680).cornerRadius(30)
    }
}
