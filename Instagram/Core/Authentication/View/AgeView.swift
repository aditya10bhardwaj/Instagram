//
//  AgeView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct AgeView: View {
    
    @State var email: String = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(AuthManager.self) var authManager
    @Environment(OnboardingManager.self) var onboardingManager
    @State private var isDatePickerPresented: Bool = false
    @State private var dob: Date = Date()
    @State private var age: Int = 18
    @State private var showFullnameView: Bool = false
    
    var onFinish: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("What's your date of birth?")
                        .font(.title)
                        .fontWeight(.regular)
                        
                    Text("Use your own date of birth, even if this account is for a business, a pet or something else. No one will see this unless you choos to share it. Why do I need to provide my date of birth?")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
                DatePicker(selection: $dob, displayedComponents: .date) {
                    Text("Date of birth (0 years old)")
                        .foregroundStyle(Color.gray)
                        .padding(12)
                        .frame(height: 60)
                }
                .background(Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
                    
                
                VStack(spacing: 12) {
                    Button {
                        self.age = calculateAge()
                        showFullnameView = true
                    } label: {
                        Text("Next")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button("I already have an account") {
                    dismiss()
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.systemBlue))
            }
            .navigationDestination(isPresented: $showFullnameView) {
                FullnameView(email: $email, age: $age, onFinish: {
                    onFinish()
                })
            }
            .onAppear {
                if let viewEmail = authManager.currentUser?.email {
                    email = viewEmail
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(Color.primary)
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            Task { await onboardingManager.updateOnboardingStatus() }
        }
    }
}

private extension AgeView {
    func calculateAge() -> Int {
        let components = Calendar.current.dateComponents(
            [.year, .month, .day],
            from: dob,
            to: Date()
        )
        if let years = components.year {
            return years
        }
        return 10
    }
}

#Preview {
//    AgeView()
}
