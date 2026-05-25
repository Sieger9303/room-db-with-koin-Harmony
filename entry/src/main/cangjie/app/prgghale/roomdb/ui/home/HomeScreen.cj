package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext

@Component
public class HomeScreen {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var address: String = ""
    @State var selectedProfessionIndex: Int64 = -1
    @State var selectedProfessionId: String = ""
    @State var selectedProfessionName: String = ""
    @State var statusMessage: String = ""

    private func canSubmit(): Bool {
        return firstName != "" && lastName != "" && address != "" && selectedProfessionId != ""
    }

    private func chooseNextProfession(): Unit {
        let professions = RoomDbContext.professions()
        if (professions.size == 0) {
            selectedProfessionIndex = -1
            selectedProfessionId = ""
            selectedProfessionName = ""
            statusMessage = "No professions available"
            return
        }

        if (selectedProfessionIndex < 0 || selectedProfessionIndex >= professions.size - 1) {
            selectedProfessionIndex = 0
        } else {
            selectedProfessionIndex += 1
        }

        let selectedProfession = professions[selectedProfessionIndex]
        selectedProfessionId = selectedProfession.professionId
        selectedProfessionName = selectedProfession.professionName
    }

    func build() {
        Column(space: 14) {
            Text("Add User")

            Text("Enter first name")
                .fontSize(14)

            TextInput(text: firstName)
                .onChange({ value: String =>
                    firstName = value
                })

            Text("Enter last name")
                .fontSize(14)

            TextInput(text: lastName)
                .onChange({ value: String =>
                    lastName = value
                })

            Text("Enter address")
                .fontSize(14)

            TextInput(text: address)
                .onChange({ value: String =>
                    address = value
                })

            Text(if (selectedProfessionName == "") { "No profession selected" } else { "Selected profession: ${selectedProfessionName}" })
                .fontSize(14)

            Button("Select profession", ButtonOptions(shape: ButtonType.Normal))
                .onClick({ _ =>
                    chooseNextProfession()
                })

             Button("Add User", ButtonOptions(shape: ButtonType.Normal))
                 .enabled(canSubmit())
                 .onClick({ _ =>
                    let addedProfessionName = selectedProfessionName
                    if (RoomDbContext.addUser(firstName, lastName, address, selectedProfessionId)) {
                        statusMessage = "Added ${firstName} ${lastName} as ${addedProfessionName}"
                        firstName = ""
                        lastName = ""
                        address = ""
                        selectedProfessionIndex = -1
                        selectedProfessionId = ""
                        selectedProfessionName = ""
                    } else {
                        statusMessage = "Failed to add user"
                    }
                })

            if (statusMessage != "") {
                Text(statusMessage)
                    .fontSize(14)
            }
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
    }
}
