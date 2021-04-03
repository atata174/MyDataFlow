//
//  ContentView.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 02.04.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView().environmentObject(timer)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    @EnvironmentObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 50, alignment: .center)
        .background(Color.red)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
