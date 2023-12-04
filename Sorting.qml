import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import org.kde.kirigami 2.20 as Kirigami
import "ui/pnid_elements"
import "ui/components"

Controls.ScrollView {
    id: pnid
    objectName: "Sorting"

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

        Shape {
            ShapePath {
                id: conveyor1
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 400; startY: 2300
                PathLine {
                    x: 3550
                    y: 2300
                }

            }
            ShapePath {
                id: conveyor2
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 4050; startY: 2300
                PathLine {
                    x: 4550
                    y: 2300
                }
            }
            ShapePath {
                id: conveyor3
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.textColor
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"

                startX: 5050; startY: 2300
                PathLine {
                    x: 6000
                    y: 2300
                }
            }

            ShapePath {
                id: colorSensorGroup
                strokeWidth: 2/pnid.zoomScale
                strokeColor: Kirigami.Theme.activeTextColor
                strokeStyle: ShapePath.DashLine
                dashPattern: [2, 4]
                fillColor: "transparent"

                startX: 1700; startY: 1650
                PathLine {
                    x: 3250; y: 1650
                }
                PathLine {
                    x: 3250; y: 3100
                }
                PathLine {
                    x: 1700; y: 3100
                }
                PathLine {
                    x: 1700; y: 1650
                }
            }
        }

        PnidUiLabel {
            text: "Color Sensor"
            x: 2100
            y: 1400
            size: "large"
            labelColor: Kirigami.Theme.activeTextColor
        }

        Container {
            objectName: "undefined"
            displayName: "Product Storage 1"
            x: 3800
            y: 1000
            maxValue: 1
            label: "Storage 1"
            labelPosition: "top"
            unit: ""
        }
        Switch {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:Slides/4:DeflectingIntoSlide1"
            displayName: "Deflector 1"
            x: 3550
            y: 2000
        }

        Container {
            objectName: "undefined2"
            displayName: "Product Storage 2"
            x: 4800
            y: 1000
            maxValue: 1
            label: "Storage 2"
            labelPosition: "top"
            unit: ""
        }
        Switch {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:Slides/4:DeflectingIntoSlide2"
            displayName: "Deflector 2"
            x: 4550
            y: 2000
        }

        LightBarrier {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:LightBarrier/4:Start"
            displayName: "Lightbarrier Start"
            x: 700
            y: 1900
        }
        LightBarrier {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:LightBarrier/4:ColourSensor"
            displayName: "Lightbarrier Color Sensor"
            x: 2100
            y: 1900
        }
        ReflectivitySensor {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:ColourDetection/4:ReflectiveLightSensor"
            displayName: "Reflectivity Sensor"
            valuePosition: "top"
            x: 2650
            y: 1900
        }
        ProximitySensor {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:ColourDetection/4:InductiveProximitySensor"
            displayName: "Inductive Proximity Sensor"
            rotation: 2
            labelPosition: "bottom"
            x: 2700
            y: 2350
        }
        LightBarrier {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:LightBarrier/4:End"
            displayName: "Lightbarrier End"
            x: 5500
            y: 1900
            activeLow: true
        }

        //TODO: Change the display names for the Leds to be more informative
        Led {
            objectName: "4:04_Sorting/4:Indicators/4:Lights/4:Red"
            displayName: "Red"
            x: 200
            y: 500
            label: displayName
            onColor: "#de2a12"
        }
        Led {
            objectName: "4:04_Sorting/4:Indicators/4:Lights/4:Yellow"
            displayName: "Yellow"
            x: 200
            y: 900
            label: displayName
            onColor: "#edbf05"
        }
        Led {
            objectName: "4:04_Sorting/4:Indicators/4:Lights/4:Green"
            displayName: "Green"
            x: 200
            y: 1300
            label: displayName
            onColor: "#1e9e22"
        }

        Motor {
            objectName: "4:04_Sorting/4:Indicators/4:Modules/4:Conveyor/4:ConveyorForward"
            displayName: "Conveyor"
            x: 100
            y: 2150
            subObjectIds: [
                "4:04_Sorting/4:Indicators/4:Modules/4:Conveyor/4:ConveyorBackward"
            ]
        }

    }
}
