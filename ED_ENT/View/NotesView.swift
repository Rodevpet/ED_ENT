//
//  Notes.swift
//  ED_ENT
//
//  Created by Robin PETIT on 02/05/2023.
//

import SwiftUI

struct Notes: View {
    let subjects:[Periode]
    //let controller:NotesController
    @State private var magnifyBy = 1.0
    @State private var width =  UIScreen.main.bounds.size.width+400
    @State private var height = UIScreen.main.bounds.size.height+400
    @State var center_x = (UIScreen.main.bounds.size.width+400)/2
    @State var center_y = (UIScreen.main.bounds.size.height+400)/2
    private var matters:[matter] = []
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged({newState in
                if (newState>0){
                    if (newState>1){
                        if(magnifyBy+0.05<1){
                            magnifyBy+=0.05
                        }
                    }else{
                        if(magnifyBy-0.05>0.1){
                            magnifyBy-=0.05
                        }
                    }
                    
                }
                })
    }
    init (subject:[Periode]){
        self.subjects = subject
        //self.controller=NotesController(XToken: XToken, Statut: Statut, id: id)
        for i in 0...9 {
            let random = Int.random(in: 10..<100)
            let x = cos(2*CGFloat.pi/10*CGFloat(i))*(250+CGFloat(random))
            let y = sin(2*CGFloat.pi/10*CGFloat(i))*(250+CGFloat(random))
            //matters.append(matter(id:random.description, x: x, y: y,text:"esg"))
        }
    }
    var body: some View {
            ZStack {
                Color.black
                ScrollView ([.horizontal,.vertical],showsIndicators: false){
                ZStack{
                    ForEach(matters) {matter in
                        line(begin: CGPoint(x: center_x, y: center_y), end: CGPoint(x: center_x+matter.x, y: center_y+matter.y)).stroke(LinearGradient(gradient: Gradient(colors: [Color("Gradient3"),Color("Gradient2")]),startPoint: .top, endPoint: .center), lineWidth: 2)
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Gradient4"),Color("Gradient2")]), startPoint: .top, endPoint: .center))
                            .frame(width: 100, height: 100)
                            .offset(x:matter.x,y:matter.y)
                            .glow(color: Color("Gradient4"), radius: 15)
                            .onTapGesture {
                                print("esg")
                            }
                        }
                    ForEach(0...90, id: \.self) { i in
                        line(begin: CGPoint(x: center_x+cos(2*CGFloat.pi/90*CGFloat(i))*110, y: center_y+sin(2*CGFloat.pi/90*CGFloat(i))*110), end: CGPoint(x: center_x+cos(2*CGFloat.pi/90*CGFloat(i))*160, y: center_y+sin(2*CGFloat.pi/1*CGFloat(i))*160))
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("Gradient2"),.blue]), startPoint: .top, endPoint: .bottom),lineWidth:1)
                    }
                    Circle().fill(
                            LinearGradient(gradient: Gradient(colors: [Color("Gradient1"),Color("Gradient2")]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 200,height: 200)
                    Circle().frame(width: 150,height: 150)
                        .foregroundColor(Color.black)
                    Text("16.00")
                        .font(.custom("GameOfSquids", fixedSize: 50))
                        .foregroundColor(.white)
                }.scaleEffect(magnifyBy)
                        .frame(width:width, height: height)
            }
        }.ignoresSafeArea()
            .gesture(magnification)

    }
}
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

// For glow effect
extension View {
    func glow(color: Color = .blue, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}

struct Notes_Previews: PreviewProvider {
    static var data_exemple:[Periode] = []
    
    static var previews: some View {
        Notes(subject: data_exemple)
    }
}

struct matter:Identifiable{
    var id: String
    let x:CGFloat
    let y:CGFloat
    let text:String
    let matter:Discipline
}

struct line:Shape{
    var begin = CGPoint(x: 0, y: 0)
    var end = CGPoint(x: 0, y: 0)
    init (begin:CGPoint,end:CGPoint){
        self.begin = begin
        self.end = end
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to:begin)
        path.addLine(to: end)
        return path
    }
}
