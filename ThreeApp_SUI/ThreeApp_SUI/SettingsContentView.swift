//  SettingsContentView.swift
//  ThreeApp_SUI


import SwiftUI

struct SettingsContentView: View {
    
    @State private var wifiSection = 0
    @State private var bluetoothSection = 0
    @State private var modemSection = 0
    @State private var isOnAvia = false
    @State private var isOnVPN = false
    var wifiState = ["Не подключено", "Подключается", "Подключено"]
    var bluetoothState = ["Выкл.", "Вкл."]
    var modemState = ["Выкл.", "Вкл."]
    
    var body: some View {
        NavigationView {
            Form {
                if #available(iOS 16.0, *) {
                    configureSectionHeaderView()
                    configurationUpdateIosView()
                    configurationBasicSettingsView()
                }
                
            }.navigationTitle("Настройки")
        }
    }
    
    @available(iOS 16.0, *)
    private func configureSectionHeaderView() -> some View {
        Section {
            NavigationLink {} label: {
                HStack {
                    Image("cat")
                    VStack(alignment: .leading) {
                        Text("Evgeny")
                            .font(.custom("Inter-Bold", size: 22))
                        Text("Apple ID, iCloud, контент и покупки")
                            .font(.custom("Inter-Regular", size: 12))
                    }
                }
            }
            NavigationLink {} label: {
                HStack {
                    Text("Предложение Apple ID")
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(Color.red).frame(width: 25, height: 25)
                        Text("3")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
    
    private func configurationUpdateIosView() -> some View {
        Section {
            NavigationLink {} label: {
                HStack {
                    Text("IOS 17.2: уже доступно")
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(Color.red).frame(width: 25, height: 25)
                        Text("3")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
    
    @available(iOS 16.0, *)
    private func configurationBasicSettingsView() -> some View {
        Section {
            HStack {
                makeImage(color: Color.avia, image: .aviaLogo)
                Toggle(isOn: $isOnAvia) {
                    Text("Авиарежим")
                }
            }
            HStack {
                makeImage(color: Color.wifi, image: .wifiLogo)
                Picker("Wi-Fi", selection: $bluetoothSection) {
                    ForEach(wifiState.indices, id: \.self) {
                        Text(wifiState[$0])
                    }
                }
            }.pickerStyle(.navigationLink)
            HStack {
                makeImage(color: Color.wifi, image: .bluethoothLogo)
                Picker("Bluetooth", selection: $wifiSection) {
                    ForEach(bluetoothState.indices, id: \.self) {
                        Text(bluetoothState[$0])
                    }
                }
            }.pickerStyle(.navigationLink)
            HStack {
                NavigationLink {} label: {
                    makeImage(color: Color.modem, image: .cellularCommunicationIcon)
                    Text("Сотовая связь")
                }
            }
            HStack {
                makeImage(color: Color.modem, image: .connectionLogo)
                Picker("Режим модема", selection: $modemSection) {
                    ForEach(modemState.indices, id: \.self) {
                        Text(modemState[$0])
                    }
                }
            }.pickerStyle(.navigationLink)
            HStack {
                makeImage(color: Color.wifi, image: .vpnLogo)
                Toggle(isOn: $isOnVPN) {
                    Text("VPN")
                }
            }
        }
    }
    
    private func makeImage(color: Color, image: ImageResource) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(color)
                .frame(width: 30, height: 30)
            Image(image)
        }
        .padding(4)
    }
}

#Preview {
    SettingsContentView()
}


