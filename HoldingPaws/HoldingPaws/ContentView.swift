//
//  ContentView.swift
//  HoldingPaws
//
//  Created by Aria Chen on 2022/4/24.
//


import SwiftUI


let GreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let skyblue = Color(red: 137.0/255.0, green: 213.0/255.0, blue: 255.0/255.0, opacity: 1.0)

let gradient = LinearGradient(gradient: Gradient(colors: [Color(red: 255.0/255.0, green: 184.0/255.0, blue: 160.0/255.0), Color(red: 230.0/255.0, green: 162.0/255.0, blue: 250.0/255.0)]), startPoint: .top, endPoint: .bottom)

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}


struct ContentView : View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
    }
    @StateObject var info = RegistrationInfo()
    
    //Login View
    var body: some View {
        NavigationView{
            ZStack{
                gradient
                    .ignoresSafeArea()
                
                VStack {
                    Welcome()
                    Logo()
                    TextField("Username", text: $info.username)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $info.password)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    NavigationLink(destination: RegistrationView(info: info).navigationBarBackButtonHidden(true)) {
                            Text("Go!")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    .aspectRatio(contentMode: .fill)
                }
                .padding()
            }
            .hiddenNavigationBarStyle()
        }
        .padding()
    }
}

struct Welcome : View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct Logo : View {
    var body: some View {
        return Image("paw")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .padding(.bottom, 75)
    }
}

//Registration View Parameters
class RegistrationInfo: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var location: String = ""
    @Published var gender: String = ""
    @Published var breed: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
}
//Registration View
struct RegistrationView: View {
    
    @ObservedObject var info: RegistrationInfo
    
    var body: some View {
        //NavigationView{
            ZStack{
                gradient
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    Photo()
                    
                    Text("Tell us a few things about your pet")
                        .foregroundColor(.white)
                    
                    TextField("Name", text: $info.name)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    TextField("Age", text: $info.age)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    TextField("Location", text: $info.location)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    TextField("Gender", text: $info.gender)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    TextField("Breed", text: $info.breed)
                        .padding()
                        .background(skyblue)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    NavigationLink(destination: ProfileView(info: info).navigationBarBackButtonHidden(true)) {
                            Text("Register")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .navigationBarBackButtonHidden(true) // not working
                    .aspectRatio(contentMode: .fill)
                }
                .padding()
                
            }
            .hiddenNavigationBarStyle()
      //  }

    }
}

struct Photo : View {
    var body: some View {
        return Image("camera")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .scaledToFit()
            .frame(width: 150, height: 150, alignment: .center)
            .padding(.bottom, 20)
    }
}

//Profile View
struct ProfileView: View {
    @ObservedObject var info: RegistrationInfo
    var body: some View {
        NavigationView{
            TabView{
                ZStack{
                    gradient
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("1")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .padding(.bottom, 20)
                        
                        Text(info.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(skyblue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(skyblue, lineWidth: 0)
                            )
                        
                        Text("USERNAME: \(info.username)")
                            .foregroundColor(.white)
                        
                        Text("AGE: \(info.age)")
                            .foregroundColor(.white)
                        
                        Text("LOCATION \(info.location)")
                            .foregroundColor(.white)
                        
                        Text("PERSONALITY: Active, Playful, Fun")
                            .foregroundColor(.white)
                        
                        .padding(.bottom, 10)
                        
                        Text("Contact Info")
                            .foregroundColor(.white)
                        
                        Text("493-2913-2934")
                            .fontWeight(.bold)
                            .padding()
                            .background(skyblue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(skyblue, lineWidth: 0)
                            )
                        
                        .padding(.bottom, 10)
                        
                        Text("Your Friends")
                            .foregroundColor(.white)
                        
                        Text("chellsee, bobbingi, leonard0")
                            .fontWeight(.bold)
                            .padding()
                            .background(skyblue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(skyblue, lineWidth: 0)
                            )

                    }
//                    .padding()
                    }
                .tabItem{
                    Image(systemName: "settings")
                    Text("Setting")
                }
                
                ChatView(info: info)
                .tabItem{
                    Image(systemName: "paw-line")
                    Text("Profile")
                }
                
                FriendsView(info: info)
                .tabItem{
                    Image(systemName: "messenger")
                    Text("Message")
                }
            }
        }
    }
}


struct ChatView: View {
    @ObservedObject var info: RegistrationInfo
    var body: some View {
        NavigationView {
            
        }
    }
}

struct FriendsView: View {
//@Citation:
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
    @ObservedObject var info: RegistrationInfo
    @State private var searchText = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    var body: some View {
        NavigationView {
                    List {
                        ForEach(searchResults, id: \.self) { name in
                            NavigationLink(destination: Text(name)) {
                                Text(name)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                    .navigationTitle("Puppy Pals")
                }
            }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}
