//
//  MainTabBarView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 14/05/24.
//

import SwiftUI

struct MainTabBarView: View {
    let user: User
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            Text("Reels")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "play.rectangle")
                }.tag(3)
            CurrentUserProfileView()
                .environmentObject(ProfileViewModel(user: user))
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView(user: User.MOCK_USERS[0])
    }
}
