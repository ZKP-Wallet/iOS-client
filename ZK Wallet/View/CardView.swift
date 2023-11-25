//
//  CardView.swift
//  ZK Wallet
//
//  Created by Mahith ‎ on 11/24/23.
//

import SwiftUI

struct CardView: View {
    var companyName: String
    var cardType: String
    var cardNumber: String
    var companySymbol: Image // Pass the company's logo as an Image
    var gradientColors: [Color] // Array of Colors for the Gradient

    var maskedCardNumber: String {
        // Mask all but the last 4 digits
        guard cardNumber.count > 4 else {
            return cardNumber // If the card number is too short, return as is.
        }
        return "*** ** " + cardNumber.suffix(4)
    }

    var body: some View {
        ZStack {
            // Customizable Gradient Background
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()

            VStack(alignment: .leading) {
                HStack {
                    // Company Symbol
                    companySymbol
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(40)

                    Spacer()
                    
                    // Card Type Name
                    Text(cardType)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.trailing, 40)
                        .offset(y: -30) // Offset upwards
                }

                Spacer()

                // Masked Card Number
                Text(maskedCardNumber)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(40)
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    CardView(
        companyName: "Social Security Administration",
        cardType: "Social Security",
        cardNumber: "000 00 9988",
        companySymbol: Image(systemName: "building.columns.fill"),
        gradientColors: [Color.blue, Color.purple]
    )
}
