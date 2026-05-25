package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext

@Component
public class HomeScreen {
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6]
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var address: String = ""
    @State var selectedProfessionId: String = ""
    @State var selectedProfessionName: String = ""
    @State var professionMenuExpanded: Bool = false
    @State var statusMessage: String = ""

    private func canSubmit(): Bool {
        return firstName != "" && lastName != "" && address != "" && selectedProfessionId != ""
    }

    private func loadProfessions(): Unit {
        RoomDbContext.bootstrap()
        let professions = RoomDbContext.professions()
        if (professions.size > 0 && selectedProfessionId == "") {
            selectedProfessionId = professions[0].professionId
            selectedProfessionName = professions[0].professionName
        }
    }

    private func selectProfession(index: Int64): Unit {
        let professions = RoomDbContext.professions()
        if (index >= 0 && index < professions.size) {
            selectedProfessionId = professions[index].professionId
            selectedProfessionName = professions[index].professionName
            professionMenuExpanded = false
        }
    }

    func build() {
        Scroll() {
            Column(space: 16) {
                Column(space: 8) {
                    Text("Enter first name")
                        .fontSize(14)
                        .fontColor(0xFF374151)

                    TextInput(text: firstName)
                        .height(48)
                        .backgroundColor(0xFFF3F4F6)
                        .borderRadius(14)
                        .padding(left: 14, right: 14)
                        .onChange({ value: String =>
                            firstName = value
                        })
                }
                .width(100.percent)

                Column(space: 8) {
                    Text("Enter last name")
                        .fontSize(14)
                        .fontColor(0xFF374151)

                    TextInput(text: lastName)
                        .height(48)
                        .backgroundColor(0xFFF3F4F6)
                        .borderRadius(14)
                        .padding(left: 14, right: 14)
                        .onChange({ value: String =>
                            lastName = value
                        })
                }
                .width(100.percent)

                Column(space: 8) {
                    Text("Enter address name")
                        .fontSize(14)
                        .fontColor(0xFF374151)

                    TextInput(text: address)
                        .height(48)
                        .backgroundColor(0xFFF3F4F6)
                        .borderRadius(14)
                        .padding(left: 14, right: 14)
                        .onChange({ value: String =>
                            address = value
                        })
                }
                .width(100.percent)

                Column(space: 8) {
                    Text("Profession")
                        .fontSize(14)
                        .fontColor(0xFF374151)

                    Row() {
                        Text(if (selectedProfessionName == "") { "No profession selected" } else { selectedProfessionName })
                            .layoutWeight(1)
                            .fontSize(14)
                            .fontColor(if (selectedProfessionName == "") { 0xFF6B7280 } else { 0xFF111827 })

                        Text("Select")
                            .fontSize(13)
                            .fontWeight(FontWeight.Medium)
                            .fontColor(0xFF2563EB)
                    }
                    .width(100.percent)
                    .padding(left: 14, right: 14, top: 14, bottom: 14)
                    .backgroundColor(0xFFF3F4F6)
                    .borderRadius(14)
                    .onClick({ _ =>
                        loadProfessions()
                        professionMenuExpanded = !professionMenuExpanded
                    })

                    if (professionMenuExpanded) {
                        Column(space: 6) {
                            ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                                if (item < RoomDbContext.professions().size) {
                                    Row() {
                                        Text(RoomDbContext.professions()[item].professionName)
                                            .fontSize(14)
                                            .fontColor(0xFF111827)
                                    }
                                    .width(100.percent)
                                    .padding(left: 14, right: 14, top: 12, bottom: 12)
                                    .backgroundColor(Color.White)
                                    .borderRadius(12)
                                    .onClick({ _ =>
                                        selectProfession(item)
                                    })
                                }
                            })
                        }
                        .width(100.percent)
                    }
                }

                Row() {
                    Blank()
                        .layoutWeight(1)

                    Button("Add User", ButtonOptions(shape: ButtonType.Normal))
                        .enabled(canSubmit())
                        .backgroundColor(if (canSubmit()) { Color(0xFF2563EB) } else { Color(0xFFBFDBFE) })
                        .fontColor(Color.White)
                        .borderRadius(12)
                        .onClick({ _ =>
                            if (RoomDbContext.addUser(firstName, lastName, address, selectedProfessionId)) {
                                statusMessage = "User added successfully"
                                firstName = ""
                                lastName = ""
                                address = ""
                                selectedProfessionId = RoomDbContext.defaultProfessionId()
                                selectedProfessionName = RoomDbContext.defaultProfessionName()
                                professionMenuExpanded = false
                            } else {
                                statusMessage = "Failed to add user"
                            }
                        })
                }

                if (statusMessage != "") {
                    Text(statusMessage)
                        .fontSize(13)
                        .fontColor(0xFF4B5563)
                }
            }
            .width(100.percent)
            .padding(left: 24, right: 24, top: 20, bottom: 28)
        }
        .width(100.percent)
        .height(100.percent)
        .onAppear({ =>
            loadProfessions()
        })
    }
}
