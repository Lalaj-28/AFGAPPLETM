import SwiftUI

struct ESPSettingsView: View {
    @Bindable var viewModel: SettingsViewModel
    @Environment(\.dismiss) private var dismiss

    private let accentBlue = Color(red: 0.231, green: 0.510, blue: 0.965)

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle("ESP Box", isOn: $viewModel.espBox)
                    Toggle("ESP Line", isOn: $viewModel.espLine)
                    Toggle("ESP Health", isOn: $viewModel.espHealth)
                    Toggle("ESP Distance", isOn: $viewModel.espDistance)
                    Toggle("ESP Name", isOn: $viewModel.espName)
                    Toggle("ESP Skeleton", isOn: $viewModel.espSkeleton)
                    Toggle("ESP Head", isOn: $viewModel.espHead)
                } header: {
                    Text("ESP Features")
                }

                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Aim FOV")
                            Spacer()
                            Text("\(Int(viewModel.fov))°")
                                .foregroundStyle(accentBlue)
                                .fontWeight(.bold)
                        }

                        Slider(value: $viewModel.fov, in: 0...180, step: 1)
                    }
                } header: {
                    Text("Aim Settings")
                }

                Section {
                    Toggle("Aimbot", isOn: $viewModel.aimbot)
                    Toggle("No Recoil", isOn: $viewModel.noRecoil)
                } header: {
                    Text("Combat")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("ESP Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        viewModel.save()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ESPSettingsView(viewModel: SettingsViewModel())
}
