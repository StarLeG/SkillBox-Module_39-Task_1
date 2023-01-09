import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Task 1")

   Rectangle{
       id: scene
       anchors.fill: mainWindow;
       state: "rightState"



       Rectangle{
           id: rectangleLeft           
           x: 100
           y: 200
           color: "lightgrey"
           width: 100
           height: 100
           border.color: "black"
           border.width: 3
           radius: 5

           MouseArea{
               anchors.fill: rectangleLeft
               onClicked:{

                   if(circle.x <= rectangleLeft.x + 100)
                   {
                       scene.state = "leftState"
                   }
                   else
                   {
                       circle.x -= 30
                   }

               }
           }

       }

       Rectangle{
           id: rectangleRight
           x: 400
           y: 200
           color: "lightgrey"
           width: 100
           height: 100
           border.color: "black"
           border.width: 3
           radius: 5

           MouseArea{
               anchors.fill: rectangleRight
               onClicked: scene.state = "rightState"
           }
       }

       Rectangle{
           id: circle
           color: "green"
           x: rectangleRight.x + 5
           y: rectangleRight.y + 5
           width: rectangleRight.width - 10
           height: rectangleRight.height - 10
           radius: width / 2


       }

       states: [
           State {
               name: "rightState"
               PropertyChanges {
                   target: circle
                   x: rectangleRight.x + 5
               }


           },
           State {
               name: "leftState"
               PropertyChanges {
                   target: circle
                   x: rectangleLeft.x + 5
               }

           }
       ]

       transitions: [
           Transition {
               from: "rightState"
               to: "leftState"
               NumberAnimation {
                   properties: "x,y"
                   duration: 1000
                   easing.type: Easing.CosineCurve
               }
           },

           Transition {
               from: "leftState"
               to: "rightState"


               NumberAnimation {
                   properties: "x,y"
                   duration: 1000
                   easing.type: Easing.InOutBounce
               }
           }
       ]

   }
}
