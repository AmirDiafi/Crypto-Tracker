//
//  StatisticView.swift
//  Crypto
//
//  Created by Amir Diafi on 12/12/22.
//

import SwiftUI

struct StatisticView: View {
    
    let statistic_vm: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(statistic_vm.title)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
            Text(statistic_vm.value)
                .font(.headline)
                .foregroundColor(.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(
                        statistic_vm.percentageChange
                        ?? 0 >= 0
                        ? Angle(degrees: 0)
                        : Angle(degrees: 180))
                    .animation(.easeIn, value: statistic_vm.percentageChange)
                Text(statistic_vm.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(
                statistic_vm.percentageChange
                ?? 0 >= 0
                ? .theme.green
                : .theme.red
            )
            .opacity(statistic_vm.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(statistic_vm: dev.statistic_1)
    }
}
