//
//  ContentView.swift
//  ScrollKit
//
//  Created by Daniel Saidi on 2023-02-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI
import ScrollKit

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    title
                    linkSection
                }
            }
            .tint(.blue)
            .toolbar(.hidden)
        }
        .tint(.white)
        .toolbarRole(.navigationStack)
    }
}

private extension ContentView {

    var title: some View {
        Text("ScrollKit Demo")
            .font(.largeTitle)
            .listRowInsets(.none)
            .listRowBackground(Color.clear)
    }

    var linkSection: some View {
        Section(header: Text("Stretchable headers")) {
            spotifyAnthraxLink
            spotifyMisfortuneLink
            spotifyReginaLink
            imageLink
            gradientLink
            colorLink
        }
    }
}

private extension ContentView {

    var colorLink: some View {
        link("paintbrush.pointed.fill", "Short color background") {
            DemoScreen(headerHeight: 100) {
                Color.blue
            }
        }
    }

    var gradientLink: some View {
        link("paintbrush.fill", "Gradient background") {
            DemoScreen(headerHeight: 250) {
                ScrollViewHeaderGradient(.yellow, .blue)
            }
        }
    }

    var imageLink: some View {
        link("photo.fill", "Image background") {
            DemoScreen(headerHeight: 250) {
                ZStack {
                    ScrollViewHeaderImage(Image("header"))
                    ScrollViewHeaderGradient(.black.opacity(0.2), .black.opacity(0.5))
                }
            }
        }
    }

    var spotifyAnthraxLink: some View {
        link("music.note", "Spotify - Anthrax") {
            SpotifyPreviewScreen(info: .anthrax)
        }
    }

    var spotifyMisfortuneLink: some View {
        link("music.note", "Spotify - Misfortune") {
            SpotifyPreviewScreen(info: .misfortune)
        }
    }

    var spotifyReginaLink: some View {
        link("music.note", "Spotify - Regina Spektor") {
            SpotifyPreviewScreen(info: .regina)
        }
    }

    func link<Destination: View>(
        _ iconName: String,
        _ title: String,
        to destination: () -> Destination
    ) -> some View {
        NavigationLink(destination: destination) {
            Label(title, systemImage: iconName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
