//
//  SwiftUIView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 31.12.2022.
//

import SwiftUI
import KinopubApi

struct DeviceCodeView: View {
    @StateObject var deviceCode = DeviceCodeViewModel()
    @EnvironmentObject var userAuth: UserAuth

    var body: some View {
        DeviceCodeViewInternal(
            deviceCode: deviceCode
        ).onAppear() {
            deviceCode.onLogin = {
                self.registerDevice()
                self.userAuth.login()
            }
        }
    }

    func registerDevice() {
        let notifyDeviceRequest = NotifyDeviceRequest(
            title: "MacOS App",
            hardware: Host.current().localizedName ?? "unknown hardware",
            software: "Kinopub App Beta"
        )

        KinopubDefaultAPI.notifyDevice(notifyDeviceRequest: notifyDeviceRequest)  { (response, error) in
            print(response)
            print(error)
            // TODO: what should we do with error?
        }
    }
}

struct DeviceCodeViewInternal<ViewModel: DeviceCodeViewModelable>: View {
    @ObservedObject var deviceCode: ViewModel

    @State var timeRemaining = 0
    @State var isCopied = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            if (deviceCode.isLoading) {
                Spinner(lineWidth: 10.0)
                    .frame(width: 60.0, height: 60.0)
            } else {
                VStack {
                    // Text
                    Text("Добавление устройства")
                        .font(.largeTitle)
                        .padding(.bottom, 20.0)

                    if (deviceCode.errorMessage == "") {
                        Text("Введите код в разделе \"Мои устройства\"")

                        if let urlObject = URL(string: deviceCode.url) {
                            Link(
                                "\(deviceCode.url)",
                                destination: urlObject
                            )
                            .foregroundColor(Color.blue)
                            .padding(.bottom, 10.0)
                        }

                        // Code block
                        ZStack {
                            Capsule()
                                .frame(width: 120.0, height: 40.0).foregroundColor(Color.blue)
                            HStack {
                                // Code
                                Text(deviceCode.userCode)
                                    .foregroundColor(Color.white)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .onTapGesture {
                                        // copy to clipboard
                                        let pasteboard = NSPasteboard.general
                                        pasteboard.declareTypes([.string], owner: nil)
                                        pasteboard.setString(deviceCode.userCode, forType: .string)
                                        
                                        // set isCopied to true, and then to false in few seconds
                                        isCopied = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            isCopied = false
                                        }
                                    }

                                // Circle progress
                                ZStack {
                                    // Background circle
                                    Circle()
                                        .stroke(lineWidth: 3.0)
                                        .opacity(0.2)
                                        .foregroundColor(Color.white)
                                    // Progress circle
                                    Circle()
                                        .trim(from: 0.0, to: CGFloat(
                                            min(Double(timeRemaining) / Double(deviceCode.seconds), 1.0)
                                        )
                                        )
                                        .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                                        .opacity(0.5)
                                        .foregroundColor(Color.white)
                                        .rotationEffect(Angle(degrees: 270.0))
                                        .animation(.linear, value: timeRemaining)
                                    // Timer
                                    Text("\(timeRemaining)")
                                        .font(.system(size: 8))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .onAppear(perform: {
                                            timeRemaining = deviceCode.seconds
                                        })
                                        .onChange(of: deviceCode.code, perform: { _ in
                                            timeRemaining = deviceCode.seconds
                                        })
                                        .onReceive(timer) { _ in
                                            if timeRemaining > 0 {
                                                timeRemaining -= 1
                                            }
                                        }
                                }
                                .frame(width: 25.0, height: 25.0)
                            }
                        }

                        Text("Код скопирован")
                            .font(.caption)
                            .opacity(isCopied ? 1.0 : 0.0)
                            .animation(.linear, value: isCopied)
                    } else {
                        Text("\(deviceCode.errorMessage)")
                            .foregroundColor(Color.red)
                    }
                }
                .padding(.all, 100.0)
            }
        }
        .frame(width: 490.0, height: 300.0)
    }
}

class PreviewDeviceCodeModel: DeviceCodeViewModelable {
    @Published var code: String = "some_code"
    @Published var userCode: String = "XBCD5F"
    @Published var url: String = "https://kino.pub/device"
    @Published var seconds: Int = 120
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    func getCode() {} // do nothing while in a Preview
    func checkForAuth(interval _: Int) {} // do nothing while in a Preview
}

struct DeviceCodeView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCodeViewInternal(
            deviceCode: PreviewDeviceCodeModel()
        )
    }
}
