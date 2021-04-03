//
//  ContentView.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 02.04.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @AppStorage("name") var name = ""
    
    var body: some View {
        VStack {
            Text("Hi, \(name)!")
                .font(.title)
                .padding()
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView().environmentObject(timer)
            Spacer()
            LogOutButton(name: $name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
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

struct LogOutButton: View {
    @EnvironmentObject var user: UserManager
    @Binding var name: String
    
    var body: some View {
        Button(action: logOutAction) {
            Text("Log Out")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 50, alignment: .center)
        .background(Color.blue)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.black, lineWidth: 4)
        )
        .padding(.bottom)
    }
    
    private func logOutAction() {
        user.name = ""
        user.isRegister.toggle()
    }
}
