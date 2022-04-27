//
//  AddJobView.swift
//  SetYourToDoList_SwiftUI
//
//  Created by Jaehoon So on 2022/04/27.
//

import SwiftUI
import CoreData

struct AddJobView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Job.entity(), sortDescriptors: [])
    private var jobs: FetchedResults<Job>
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle("할 일 추가하기")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        AddJobView()
    }
}
