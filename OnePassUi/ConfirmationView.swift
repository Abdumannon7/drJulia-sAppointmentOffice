//
//  ConfirmationView.swift
//  OnePassUi
//
//  Created by Abdumannon on 11/25/23.
//

import SwiftUI

struct ConfirmationView: View {
    var currentDate: Date
    var body: some View {
        VStack {
            Image("Doctor")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Confirmed")
                .font(.title)
                .bold()
                .padding()
            
            Text("You are scheduled with Dr. Julia.")
            
            Divider()
                .padding()
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                    
                    Text("Eye Examination")
                }
                
                HStack {
                    Image(systemName: "location")
                    
                    Text("South Allen Street 1331W, Room:105")
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "calendar")
                    
                    Text(currentDate.bookingViewDateFormat())
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Done")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                    )
            }

        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmationView(currentDate: Date())
        }
    }
}
