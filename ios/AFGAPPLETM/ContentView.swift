import SwiftUI

struct ContentView: View {
    @State private var viewModel = SettingsViewModel()
    @State private var showSettings: Bool = false

    private let backgroundColor = Color(red: 0.039, green: 0.086, blue: 0.157)
    private let cardBackground = Color(red: 0.07, green: 0.12, blue: 0.22)
    private let accentBlue = Color(red: 0.231, green: 0.510, blue: 0.965)

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    headerSection
                    licenseCard
                    actionButtons
                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .sheet(isPresented: $showSettings) {
            ESPSettingsView(viewModel: viewModel)
        }
        .onChange(of: viewModel.isEnabled) { _, _ in
            viewModel.save()
        }
    }

    private var headerSection: some View {
        VStack(spacing: 8) {
            HStack(spacing: 12) {
                KLogoView()
                    .frame(width: 56, height: 56)

                VStack(alignment: .leading, spacing: 2) {
                    Text("AFG APPLE TM")
                        .font(.system(.title, design: .default, weight: .bold))
                        .foregroundStyle(accentBlue)

                    Text("Version 1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }

                Spacer()
            }
        }
    }

    private var licenseCard: some View {
        VStack(spacing: 16) {
            Text("License Information")
                .font(.title3.bold())
                .foregroundStyle(accentBlue)

            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Key:")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        Text("AFG-APPL...KEY-2026")
                            .foregroundStyle(.white)
                        Spacer()
                    }

                    Text("UDID: \(deviceUUID)")
                        .foregroundStyle(Color(.lightGray))
                        .font(.subheadline)

                    Text("Expire: 2099-12-31")
                        .foregroundStyle(.yellow)
                        .fontWeight(.bold)
                }

                Button("Exit Key") {
                    // Exit key action
                }
                .font(.subheadline.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color(red: 0.8, green: 0.25, blue: 0.25))
                .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding(20)
        .background(cardBackground)
        .clipShape(.rect(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(accentBlue.opacity(0.3), lineWidth: 1)
        )
    }

    private var actionButtons: some View {
        VStack(spacing: 16) {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    viewModel.isEnabled.toggle()
                }
            } label: {
                Text(viewModel.isEnabled ? "ENABLED: TRUE" : "ENABLED: FALSE")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(viewModel.isEnabled ? Color.green : Color.red)
                    .clipShape(.rect(cornerRadius: 14))
            }
            .sensoryFeedback(.impact, trigger: viewModel.isEnabled)

            Button {
                showSettings = true
            } label: {
                Text("Option")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(accentBlue)
                    .clipShape(.rect(cornerRadius: 14))
            }
        }
    }

    private var deviceUUID: String {
        UIDevice.current.identifierForVendor?.uuidString.uppercased() ?? "UNKNOWN"
    }
}

struct KLogoView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )

            Text("K")
                .font(.system(size: 32, weight: .black, design: .rounded))
                .foregroundStyle(.white)

            Text("Sensi")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundStyle(.red)
                .offset(y: 18)
        }
    }
}

#Preview {
    ContentView()
}
