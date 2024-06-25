//
//  SegmentTestView.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/20/24.
//

import SwiftUI
import Optimizely

struct SegmentTestView: View {
    
    @StateObject var viewModel = SegmentTestViewModel()
    
    @State private var userId: String = ""
    @State private var attributeName: String = ""
    @State private var attributeValue: String = ""
    @State private var eventNameSegment: String = ""
    @State private var flagNameOptimizely: String = ""
    
    @State private var decision: OptimizelyDecision? = nil
    
    @State private var ruleKey: String = "_null_"
    @State private var variationKey: String = "_null_"
    
    @State private var currentSegmentUserId: String = ""
    @State private var currentSegmentAttributes: [String: Any] = [:]
    
    @State private var currentOptimizelyUserId: String = ""
    @State private var currentOptimizelyAttributes: [String: Any] = [:]
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Configure User")
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
                    .bold()
                
                HStack{
                    Text("Current User ID: ")
                    Text(viewModel.userId)
                }
                .font(.footnote)
                
                VStack{
                    Text("Current Attributes: ")
                    ForEach(viewModel.attributes.keys.sorted(), id: \.self){ key in
                        HStack{
                            Text(key)
                            Text(" : ")
                            Text("\(viewModel.attributes[key]!)")
                        }
                    }
                }
                .font(.footnote)
                
                TextField("Enter User ID", text: $userId)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(
                        .roundedBorder
                    )
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                Button(action: {
                    viewModel.setUserId(new_userId: userId);
                    userId=""
                    }, label: {
                        Text("Set User ID")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                HStack{
                    TextField("Attribute Name", text: $attributeName)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 5))
                    TextField("Attribute Value", text: $attributeValue)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 20))
                }
                
                Button(action: {
                    viewModel.addUserAttribute(name: attributeName, value: attributeValue);
                    attributeName = "";
                    attributeValue = ""
                    },
                    label: {
                        Text("Add Attribute")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            
            VStack{
                Text("Segment Functions")
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
                    .bold()
                
                Button(action: {viewModel.initSegment()},
                    label: {
                        Text("Initialize Segment")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                HStack{
                    Text("Segment Initialized: ")
                    Text(viewModel.analyticsInitialized)
                }
                .font(.footnote)
                
                Button(action: {
                    viewModel.identifySegment();
                    currentSegmentUserId = viewModel.userId;
                    currentSegmentAttributes = viewModel.attributes},
                    label: {
                        Text("Call Segment Identify")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                HStack{
                    Text("Current User ID: ")
                    Text(currentSegmentUserId)
                }
                .font(.footnote)
                
                VStack{
                    Text("Current Attributes: ")
                    ForEach(currentSegmentAttributes.keys.sorted(), id: \.self){ key in
                        HStack{
                            Text(key)
                            Text(" : ")
                            Text("\(currentSegmentAttributes[key]!)")
                        }
                    }
                }
                .font(.footnote)
                
                TextField("Enter Event Name", text: $eventNameSegment)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(
                        .roundedBorder
                    )
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                Button(action: {viewModel.trackSegment(name: eventNameSegment);eventNameSegment=""},
                    label: {
                        Text("Call Segment Track")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            
            VStack{
                Text("Optimizely Functions")
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
                    .bold()
                
                Button(action: {viewModel.initOptimizely()},
                    label: {
                        Text("Initialize Optimizely")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                HStack{
                    Text("Optimizely Initialized: ")
                    Text(viewModel.optimizelyInitialized)
                }
                .font(.footnote)
                
                Button(action: {viewModel.setOptimizelyUser();
                    currentOptimizelyUserId = viewModel.userId;
                    currentOptimizelyAttributes = viewModel.attributes},
                    label: {
                        Text("Set Optimizely User")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                HStack{
                    Text("Current User ID: ")
                    Text(currentOptimizelyUserId)
                }
                .font(.footnote)
                
                VStack{
                    Text("Current Attributes: ")
                    ForEach(currentOptimizelyAttributes.keys.sorted(), id: \.self){ key in
                        HStack{
                            Text(key)
                            Text(" : ")
                            Text("\(currentOptimizelyAttributes[key]!)")
                        }
                    }
                }
                .font(.footnote)
                
                TextField("Enter Flag Rule Key", text: $flagNameOptimizely)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(
                        .roundedBorder
                    )
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                Button(action: {
                        decision = viewModel.decideOptimizely(flagKey: flagNameOptimizely);
                        ruleKey = decision?.ruleKey ?? "_null_";
                        variationKey = decision?.variationKey ?? "_null_";
                        flagNameOptimizely = ""
                    },
                    label: {
                        Text("Call Decide Method")
                    })
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                Text("Rule Key: " + ruleKey)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                Text("Variation Key: " + variationKey)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
                
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
        }

    }
}

#Preview {
    SegmentTestView()
}
