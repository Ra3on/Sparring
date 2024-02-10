//
//  UserInput .swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/10/24.
//
import SwiftUI

struct UserInput_: View {
    @State private var heightFeet = ""
    @State private var heightInches = ""
    @State private var level = ""
    @State private var age = 18 // Default age set to 18
    @State private var trainingLocation = ""
    @State private var martialArts = ["Aikido", "Boxing", "Brazilian Jiu-Jitsu", "Bujinkan", "Capoeira", "Escrima", "Fencing", "Hapkido", "Jiu-Jitsu", "Judo", "Karate", "Kalaripayattu", "Kenpo", "Kickboxing", "Kendo", "Krav Maga", "Kung Fu", "Luta Livre", "Muay Thai", "MMA", "Pankration", "Sambo", "Sanshou", "Savate", "Silat", "Systema", "Tae Bo", "Tae Kwon Do", "Tai Chi", "Taijutsu", "Tang Soo Do", "Vale Tudo", "Wing Chun", "Wrestling", "Wushu"
    ]
    @State private var levels = ["beginner", "intermediate", "advanced","semi-professional", "professional"]
    
    @State private var selectedArts: [String] = []
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                HeightInput(heightFeet: $heightFeet, heightInches: $heightInches)
                LevelInput(level: $level)
                AgeInput(age: $age)
                TrainingLocationInput(trainingLocation: $trainingLocation)
            }
            
            Section(header: Text("Martial Arts")) {
                Picker("Martial Arts", selection: $selectedArts) {
                    ForEach(martialArts, id: \.self) { art in
                        Text(art)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }
            
            Button("Submit") {
                print("Height: \(heightFeet) feet \(heightInches) inches")
                print("Level: \(level)")
                print("Age: \(age)")
                print("Training Location: \(trainingLocation)")
                print("Selected Martial Arts: \(selectedArts)")
            }
        }
        .navigationTitle("User Input")
    }
}

struct HeightInput: View {
    @Binding var heightFeet: String
    @Binding var heightInches: String

    var body: some View {
        HStack {
            Text("Height")
                .padding(.vertical)
            TextField("", text: $heightFeet)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 50)

            Text("Ft")
                .padding(.vertical)

            TextField("", text: $heightInches)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 50)

            Text("Inches")
        }
    }
}

struct LevelInput: View {
    @Binding var level: String
    @State private var selectedLevelIndex = 0
    
    let levels = ["Beginner", "Intermediate", "Advanced", "Semi-Professional", "Professional"]
    
    var body: some View {
        VStack {
            Picker("Level", selection: $level) { // Bind directly to level here
                ForEach(0..<levels.count) { index in
                    Text(levels[index])
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
        }
    }
}



struct AgeInput: View {
    @Binding var age: Int
    
    var body: some View {
        Picker("Age", selection: $age) {
            ForEach(18 ..< 100, id: \.self) {
                Text("\($0)")
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}

struct TrainingLocationInput: View {
    @Binding var trainingLocation: String
    
    var body: some View {
        TextField("Training Location", text: $trainingLocation)
    }
}

struct UserInput__Previews: PreviewProvider {
    static var previews: some View {
        UserInput_()
    }
}
