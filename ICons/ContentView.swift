//
//  ContentView.swift
//  ICons
//
//  Created by Justin King on 2022-03-13.
//

import SwiftUI
  
struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
       NavigationView{
            ZStack(alignment: .center){
                GradientView().scaledToFill().transition(.identity)
                VStack(alignment: .center){
                    ImageView(image: "Screen Shot")
                        .frame(minWidth: 150, idealWidth: 200 , maxWidth: 250, minHeight: 150, idealHeight: 200, maxHeight: 250, alignment: .center).cornerRadius(48).scaledToFit()
                    TextView().scaledToFit()
                    TextField( "NetID@queensu.ca", text: $username)
                        .padding().font(Font.system(size: 20))
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color(red: 0.9, green: 0.9 , blue: 0.9, opacity: 1)))
                        .frame(width: 350, height: 35).padding().foregroundColor(.black).scaledToFit()

                    SecureField("Password", text: $password)
                        .padding().font(Font.system(size: 20)).background((Color(red: 0.9, green: 0.9 , blue: 0.9, opacity: 1)))
                        .cornerRadius(5).frame(width: 350, height:35 ).padding(.bottom, 20).foregroundColor(.black).scaledToFit()
                    
                    NavigationLink (destination: SecondScreen(), label:{ LoginView()})
                            
                }
                .scaledToFit()
            }.navigationBarHidden(true)
            
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color(red: 0.0, green: 0.3, blue: 0.6).opacity(0.9))
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
    
    }
}

struct SecondScreen: View {
    
    
    var body: some View {
        TabView{
            Browse()
                .tabItem(){
                    Image(systemName: "eye")
                    Text("Browse")
                }
            Search()
                .tabItem(){
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            checkout()
                .tabItem(){
                    Image(systemName: "cart")
                    Text("Checkout")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)

    }
}


struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
 
    func body(content: Content) -> some View {
        var gradientColors = [Color]()
 
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
 
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
 
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
 
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
        guard let fromColor = fromColor.cgColor.components else { return Color(fromColor) }
        guard let toColor = toColor.cgColor.components else { return Color(toColor) }
 
        let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
 
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}
extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}
struct GradientView: View{
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [Color(red: 0, green: 0, blue: 0.7), .yellow, .red])
    let gradient2 = Gradient(colors: [.yellow, .red ,Color(red: 0, green: 0, blue: 0.6)])
    var body: some View {
            Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true).delay(1)) {
                    self.progress = 1.0
                }
            }.scaledToFill()
    }
}


struct LoginView: View {
    var body: some View{
          Text("LOGIN").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.white).padding(.all, 1.0).frame(width: 150, height:50).background(Color.yellow).cornerRadius(25).shadow(radius: 10)
    }
}
struct CheckView: View {
    var body: some View{
          Text("CheckOut").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.white).padding(.all).frame(width: 150, height:50).background(.yellow).cornerRadius(25).shadow(radius: 10)
    }
}
struct TextView: View {
    var body: some View{
        Text("ICons Equipment Rental").font(.system(size: 33, weight: .medium,design: .serif))
            .foregroundColor(.white).padding(.all).scaledToFit()
    }
}

struct ImageView: View {
    var image = ""
    var body: some View{
        Image(image)
            .resizable().aspectRatio(contentMode: .fit)
            .clipped().scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
               // .previewDevice("iPhone SE (2nd generation)")
            SecondScreen()
                .previewInterfaceOrientation(.portrait)
            
        }
    }
}
