//
//  DayView.swift
//  OnePassUi
//
//  Created by Abdumannon on 11/24/23.
//

import SwiftUI

struct DayView: View {
    @State var dates = [
        Date(),
        Calendar.current.date(byAdding:.hour, value: 1, to: Date())!,
        Calendar.current.date(byAdding:.hour, value:2, to: Date())!,
        Calendar.current.date(byAdding:.hour, value:3, to: Date())!,
        Calendar.current.date(byAdding:.hour, value:4, to: Date())!,
    ]
    @State var selectedDate: Date?
    var currentDate: Date
    var body: some View {
        NavigationStack{
                ScrollView{
                    VStack{
                        Text(currentDate.fullMonthDayYearFormat())
                        Divider()
                            .padding(.vertical)
                        Text("Select a Time")
                            .font(.largeTitle)
                            .bold()
                        Text("Duration: 30 mins")
                        ForEach(dates, id: \.self){date in
                            HStack {
                                Button{
                                    withAnimation{
                                        selectedDate = date
                                    }
                                }label:{
                                    Text(date.timeFromDate())
                                        .bold()
                                    
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(selectedDate == date ? .white : .blue)
                                        .background(
                                            ZStack{
                                                if selectedDate == date{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .foregroundColor(.green)
                                                }else{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke()
                                                    
                                                }
                                            }
                                        )
                                }
                                if selectedDate == date{
                                    NavigationLink{
                                        BookingView(currentDate: date)
                                    } label:{
                                        Text("Next")
                                            .bold()
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.blue)
                                            )
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle(currentDate.dayOfTheWeek())
                .navigationBarTitleDisplayMode(.inline)
            }
        }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(currentDate: Calendar.current.date(byAdding:.day, value:3, to: Date())!)
    }
}
