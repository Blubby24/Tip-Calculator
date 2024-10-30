//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Dorian Hawkins on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State private var tip: Double = 0.0
    @State private var bill = Bill()
    @State private var dinners: Int = 1
    @State private var percent: Double = 0.20
    @State private var billInput: String = ""
    @State private var dinnersInput: String = ""
    @State private var percentInput: String = ""


    var body: some View {
        VStack {
            
            Text("Each person has to tip: \(tip, specifier: "%.2f")")
                .padding(.top)
                .font(.title)
                .foregroundColor(.black)
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                
                ZStack(alignment: .leading) {
                    TextField("", text: $billInput)
                        .padding(.vertical, 15)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 200)
                        .background(
                            Rectangle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 2)            .background(Color.white)
                        )
                    if billInput.isEmpty {
                        Text("Enter the total bill")
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                ZStack(alignment: .leading) {
                    TextField("", text: $dinnersInput)
                        .padding(.vertical, 15)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 200)
                        .background(
                            Rectangle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 2)            .background(Color.white)
                        )
                    if dinnersInput.isEmpty {
                        Text("Enter the number of dinners")
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                
                ZStack(alignment: .leading) {
                    TextField("", text: $percentInput)
                        .padding(.vertical, 15)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 200)
                        .background(
                            Rectangle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 2)            .background(Color.white)
                        )
                    if percentInput.isEmpty {
                        Text("Enter the tip %")
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                
            }
                Button(action: {
                    var valid: Bool = false
                    if let billValue = Double(billInput), let dinnersValue = Int(dinnersInput), let percentValue = Double(percentInput){
                        bill.total_cost = billValue
                        percent = percentValue/100
                        dinners = dinnersValue
                        valid = true
                        
                    } else {
                        print("Invalid bill input")
                    }
                    if valid{
                        tip = bill.calculateTipPerPerson(dinners: dinners, percent: percent)
                    }
                    }) {
                    HStack {
                        Image(systemName: "highlighter")
                        Text("Calculate Tip")
                            .padding(.horizontal)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isPressed)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity)
                .padding(0)
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            isPressed = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressed = false
                            }
                        }
                )
            }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire screen
        .ignoresSafeArea() // Optional: If you want it to cover safe areas
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
