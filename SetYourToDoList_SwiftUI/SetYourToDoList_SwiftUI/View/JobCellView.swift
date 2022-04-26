//
//  JobCellView.swift
//  SetYourToDoList_SwiftUI
//
//  Created by Jaehoon So on 2022/04/27.
//

import SwiftUI

struct JobCellView: View {
    
    var jobImageName: String = "seal"
    var jobTitle: String
    var jobStartTime: Date
    var jobEndTime: Date
    var isJobAchieved: Bool
    var cellColor: Color = Color.yellow
    
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var body: some View {
        HStack {
            Image(systemName: jobImageName)
                .font(.system(size: 40))
                .foregroundColor(Color.white)
            Spacer().frame(width: 10)
            VStack(alignment: .leading) {
                Divider().frame(height: 0).opacity(0) // 공간 넓히기용 divider. height가 0이라 보이지않음 Rectangle로 구현해도 됨.
                Text("\(jobTitle)")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                Text("\(jobStartTime, formatter: JobCellView.dateformat) - \(jobEndTime, formatter: JobCellView.dateformat)")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(cellColor)
        .cornerRadius(15)
    }
}

struct JobCellView_Previews: PreviewProvider {
    static var previews: some View {
        JobCellView(jobImageName: "seal", jobTitle: "제목", jobStartTime: Date(), jobEndTime: .now + 10, isJobAchieved: false)
    }
}
