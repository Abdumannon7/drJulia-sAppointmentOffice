//
//  BookingView.swift
//  OnePassUi
//
//  Created by Abdumannon on 11/25/23.
//

import SwiftUI

struct BookingView: View {
    @State private var notes = " "
    var currentDate: Date
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 16){
                HStack{
                    Image(systemName: "clock")
                    Text("30 min")
                    
                }
                HStack(spacing: 16){
                    Image(systemName: "location")
                    Text("In person South Allen Street 1331W, Room:105")
                    
                }
                HStack(alignment: .top, spacing: 16){
                    Image(systemName: "calendar")
                    Text(currentDate.bookingViewDateFormat())
                    
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16){
                Text("Enter Details")
                    .font(.title)
                    .bold()
                Text("Please share anything that will help prepare for our meeting.")
                
                TextField("", text: $notes, axis: .vertical)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                Spacer()
                NavigationLink {
                    ConfirmationView(currentDate: currentDate)
                } label: {
                    Text("Schedule Event")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                        )
                }


            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Dr. Julia's")
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            BookingView(currentDate: Date())
        }
    }
}
