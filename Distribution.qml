import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import org.kde.kirigami 2.20 as Kirigami
import "ui/pnid_elements"
import "ui/components"

Controls.ScrollView {
    id: pnid
    objectName: "Distribution"

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

        //DebugRectangle {}
        Container {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine1/4:FillLevelCalculated"
            displayName: "Magazine 1"
            x: 2000
            y: 500
            maxValue: 6
            label: "Discs Red"
            labelPosition: "top"
            unit: "#"
        }
        MagazineEjector {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine1/4:SlideExtended"
            displayName: "Magazine 1 Ejector"
            x: 1300
            y: 1500
            subObjectIds: [
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine1/4:SlideEmpty",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine1/4:ExtendSlide",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine1/4:SlideRetracted"
            ]
        }

        Container {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine2/4:FillLevelCalculated"
            displayName: "Magazine 1"
            x: 3700
            y: 500
            maxValue: 6
            label: "Discs Black"
            labelPosition: "top"
            unit: "#"
        }
        MagazineEjector {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine2/4:SlideExtended"
            displayName: "Magazine 2 Ejector"
            x: 3000
            y: 1500
            subObjectIds: [
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine2/4:SlideEmpty",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine2/4:ExtendSlide",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine2/4:SlideRetracted"
            ]
        }

        Container {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine3/4:FillLevelCalculated"
            displayName: "Magazine 1"
            x: 5400
            y: 500
            maxValue: 6
            label: "Discs Metal"
            labelPosition: "top"
            unit: "#"
        }
        MagazineEjector {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Magazine3/4:SlideExtended"
            displayName: "Magazine 3 Ejector"
            x: 4700
            y: 1500
            subObjectIds: [
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine3/4:SlideEmpty",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine3/4:ExtendSlide",
                "4:01_Distribution/4:Indicators/4:Elements/4:Magazine3/4:SlideRetracted"
            ]
        }

        GasBottle {
            disablePopup: true
            x: 6400
            y: 500
            label: "Air"
        }

        LightBarrier {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:LightBarriers/4:Start"
            displayName: "Lightbarrier Start"
            x: 1000
            y: 1900
        }
        LightBarrier {
            //TODO: I think this objectName may be wrong
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:LightBarriers/4:BeforeRFID"
            displayName: "Lightbarrier Start"
            x: 6800
            y: 1900
        }
        LightBarrier {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:LightBarriers/4:End"
            displayName: "Lightbarrier Start"
            x: 7800
            y: 1900
            activeLow: true
        }

        //TODO: Change the display names for the Leds to be more informative
        Led {
            objectName: "4:01_Distribution/4:Indicators/4:Lights/4:Red"
            displayName: "Red"
            x: 500
            y: 500
            label: displayName
            onColor: "#de2a12"
        }
        Led {
            objectName: "4:01_Distribution/4:Indicators/4:Lights/4:Yellow"
            displayName: "Yellow"
            x: 500
            y: 900
            label: displayName
            onColor: "#edbf05"
        }
        Led {
            objectName: "4:01_Distribution/4:Indicators/4:Lights/4:Green"
            displayName: "Green"
            x: 500
            y: 1300
            label: displayName
            onColor: "#1e9e22"
        }

        Motor {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:Conveyor/4:ConveyorForward"
            displayName: "Conveyor"
            x: 400
            y: 2150
            subObjectIds: [
                "4:01_Distribution/4:Indicators/4:Elements/4:Conveyor/4:ConveyorBackward"
            ]
        }


        Shape {
            ShapePath {
                id: conveyor
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 700; startY: 2300
                PathLine {
                    x: 8000
                    y: 2300
                }
            }

            ShapePath {
                id: ejectorPneumatics

                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 1300; startY: 1650
                PathLine {
                    x: 1100
                    y: 1650
                }
                PathLine {
                    x: 1100
                    y: 100
                }
                PathLine {
                    x: 6600
                    y: 100
                }
                PathLine {
                    x: 6600
                    y: 500
                }
            }
            ShapePath {
                id: ejectorPneumatics2

                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 3000; startY: 1650
                PathLine {
                    x: 2800
                    y: 1650
                }
                PathLine {
                    x: 2800
                    y: 100
                }
            }
            ShapePath {
                id: ejectorPneumatics3

                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 4700; startY: 1650
                PathLine {
                    x: 4500
                    y: 1650
                }
                PathLine {
                    x: 4500
                    y: 100
                }
            }
        }

        RfidReadWrite {
            objectName: "4:01_Distribution/4:Indicators/4:Elements/4:RFID"
            displayName: "RFID"
            x: 7100
            y: 1200
        }
    }
}
