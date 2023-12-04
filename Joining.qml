import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import org.kde.kirigami 2.20 as Kirigami
import "ui/pnid_elements"
import "ui/components"

Controls.ScrollView {
    id: pnid
    objectName: "Joining"

    Controls.ScrollBar.horizontal.policy: Controls.ScrollBar.AsNeeded
    Controls.ScrollBar.vertical.policy: Controls.ScrollBar.AsNeeded
    contentHeight: pnidItem.height * pnid.zoomScale
    contentWidth: pnidItem.width * pnid.zoomScale

    property double zoomScale: 0.125

    Component.onCompleted: {
        pnidHandler.registerPnid(pnid);
    }

    Item {
        id: pnidItem
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
        transform: Scale {origin.x: 0; origin.y: 0; xScale: pnid.zoomScale; yScale: pnid.zoomScale}

        /*GasBottle {
            disablePopup: true
            x: 6100
            y: 500
            label: "Air"
        }*/

        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:Start"
            displayName: "Lightbarrier Start"
            x: 700
            y: 1900
        }
        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:RFID"
            displayName: "Lightbarrier RFID"
            x: 1500
            y: 1900
        }
        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:CapEnd"
            displayName: "Lightbarrier Cap End"
            activeLow: true
            valuePosition: "left"
            rotation: 1
            x: 1900
            y: 500
        }
        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:CapMiddle"
            displayName: "Lightbarrier Cap Middle"
            activeLow: true
            valuePosition: "left"
            rotation: 1
            x: 1900
            y: 900
        }
        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:CapPickup"
            displayName: "Lightbarrier Cap Pickup"
            valuePosition: "left"
            rotation: 1
            x: 1900
            y: 1300
        }
        LightBarrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:LightBarrier/4:End"
            displayName: "Lightbarrier End"
            x: 5500
            y: 1900
            activeLow: true
        }

        //TODO: Change the display names for the Leds to be more informative
        Led {
            objectName: "4:03_Joining/4:Indicators/4:Lights/4:Red"
            displayName: "Red"
            x: 200
            y: 500
            label: displayName
            onColor: "#de2a12"
        }
        Led {
            objectName: "4:03_Joining/4:Indicators/4:Lights/4:Yellow"
            displayName: "Yellow"
            x: 200
            y: 900
            label: displayName
            onColor: "#edbf05"
        }
        Led {
            objectName: "4:03_Joining/4:Indicators/4:Lights/4:Green"
            displayName: "Green"
            x: 200
            y: 1300
            label: displayName
            onColor: "#1e9e22"
        }

        Motor {
            objectName: "4:03_Joining/4:Indicators/4:Elements/4:Conveyor/4:ConveyorForward"
            displayName: "Conveyor"
            x: 100
            y: 2150
            subObjectIds: [
                "4:03_Joining/4:Indicators/4:Elements/4:Conveyor/4:ConveyorBackward"
            ]
        }
        Motor {
            objectName: "4:03_Joining/4:Indicators/4:Elements/4:Conveyor/4:unknown"
            displayName: "Conveyor"
            valuePosition: "left"
            x: 2150
            y: 100
            subObjectIds: [
                "4:03_Joining/4:Indicators/4:Elements/4:Conveyor/4:ConveyorBackward"
            ]
        }

        PickAndPlace {
            objectName: "2:MyObject/2:MyVariable1"//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:ArmExtended"
            valuePosition: "none"
            rotation: 1
            x: 2350
            y: 1600
            subObjectIds: [
                "2:MyObject/2:MyVariable2",//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:ArmRetracted",
                "2:MyObject/2:MyVariable3",//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:SuctionCupDown",
                "2:MyObject/2:MyVariable4",//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:SuctionCupIsUp",
                "2:MyObject/2:MyVariable5",//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:VacuumOn",
                "2:MyObject/2:MyVariable6"//"4:03_Joining/4:Indicators/4:Modules/4:PickAndPlace/4:WorkpiecePickedUp"
            ]
        }

        Barrier {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:Gate/4:CloseGate"
            displayName: "Gate"
            x: 3000
            y: 1900
            subObjectIds: [
                "4:03_Joining/4:Indicators/4:Modules/4:Gate/4:OpenGate"
            ]
        }

        RfidReadWrite {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:unknown"
            displayName: "RFID"
            x: 1100
            y: 1500
        }
        RfidReadWrite {
            objectName: "4:03_Joining/4:Indicators/4:Modules/4:unknown"
            displayName: "RFID"
            x: 4100
            y: 1500
        }


        Shape {
            ShapePath {
                id: conveyor
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 400; startY: 2300
                PathLine {
                    x: 6000
                    y: 2300
                }
            }
            ShapePath {
                id: capConveyor

                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 2300; startY: 1800
                PathLine {
                    x: 2300
                    y: 400
                }
            }
        }
    }
}
