//
//  SettingsView.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/21/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State var newSegmentSDKKey: String = ""
    @State var newOptimizelySDKKey: String = ""
    
    var body: some View {
        HStack{
            Text("Current Segment SDK Key: ")
            Text(Globals.segmentSDKKey)
        }
        .font(.footnote)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        
        TextField("Enter SDK Key", text: $newSegmentSDKKey)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .textFieldStyle(
                .roundedBorder
            )
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
        
        Button(action: {Globals.segmentSDKKey = newSegmentSDKKey;newSegmentSDKKey=""},
            label: {
                Text("Update Segment SDK Key")
            })
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
        
        HStack{
            Text("Current Optimizely SDK Key: ")
            Text(Globals.optimizelySDKKey)
        }
        .font(.footnote)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        
        TextField("Enter SDK Key", text: $newOptimizelySDKKey)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .textFieldStyle(
                .roundedBorder
            )
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
        
        Button(action: {Globals.optimizelySDKKey = newOptimizelySDKKey;newOptimizelySDKKey=""},
            label: {
                Text("Update Optimizely SDK Key")
            })
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
    }
}

#Preview {
    SettingsView()
}
