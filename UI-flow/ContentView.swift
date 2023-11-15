//
//  ContentView.swift
//  UI-flow
//
//  Created by Abdumannon on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var selectedTimeSlot: String = "Select Time"
    @State private var selectedService: String = "Select Service"
    let services = ["Regular Check-Up", "Eye Tests", "Consultation"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Service Type")) {
                    Picker("Select Service", selection: $selectedService) {
                        ForEach(services, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section(header: Text("Date")) {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                }

                Section(header: Text("Time")) {
                    Picker("Time Slot", selection: $selectedTimeSlot) {
                        ForEach(["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM"], id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    Button("Confirm Appointment") {
                        // Handle appointment confirmation
                    }
                }
            }
            .navigationTitle("Dr. Julia's Appointments")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
