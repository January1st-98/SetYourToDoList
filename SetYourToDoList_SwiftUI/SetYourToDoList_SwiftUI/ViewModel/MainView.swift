//
//  ContentView.swift
//  SetYourToDoList_SwiftUI
//
//  Created by Jaehoon So on 2022/04/26.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Job.entity(), sortDescriptors: [])
    private var jobs: FetchedResults<Job>
//    private var items: FetchedResults<Item>

    var colorArr: [Color] = [
        Color.orange, .yellow, .green, .blue, .gray, .brown, .black
    ]
    var colorIndex: Int = 2
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(jobs) { job in
                        NavigationLink {
                            Text("job title: \(job.title!)")
                        } label: {
                            JobCellView(jobTitle: job.title!,
                                        jobStartTime: job.startTime!,
                                        jobEndTime: job.endTime!,
                                        isJobAchieved: job.isAchieved,
                                        cellColor: colorArr[colorIndex])
                                .listRowSeparator(.hidden)
                        }
                    }
    //                ForEach(items) { item in
    //                    NavigationLink {
    //                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
    //                    } label: {
    //                        Text(item.timestamp!, formatter: itemFormatter)
    //                    }
    //                }
    //                .onDelete(perform: deleteItems)
                } // List
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 22))
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "gear")
                            .font(.system(size: 22))
                    }
                } // toolbar
                .navigationTitle("할 일 목록")
                .navigationBarTitleDisplayMode(.inline)
                
                NavigationLink {
                    AddJobView()
                } label: {
                    Circle()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }
                        .padding()
                }
                    
            }
            
        } // NavigationView
    } // View

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
