//
//  ContentView.swift
//  SwiftUiSample
//  
//  Created by ji-no on 2024/11/25
//  
//

import SwiftUI

let defaultWidth: CGFloat = 150
let defaultHeight: CGFloat = 44

struct DefaultButtonStyle: ButtonStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(0)
            .background(Color.blue)   //背景色
            .foregroundColor(.white)  //文字色
            .font(.body.bold())       //フォントサイズ・スタイル
    }
}

struct BorderButtonStyle: ButtonStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(0)
            .background(Color.white)   //背景色
            .foregroundColor(.black)  //文字色
            .font(.body.bold())       //フォントサイズ・スタイル
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct ButtonTextView: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Text(title)
            .frame(
                width: width,
                height: height
            )
    }
}

struct ButtonImageAndTextView: View {
    enum ImageAlignment {
        case left
        case right
    }
    
    let imageAlignment: ImageAlignment
    let title: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        HStack {
            switch imageAlignment {
            case .left:
                Image(systemName: "globe")
                Text(title)
            case .right:
                Text(title)
                Image(systemName: "globe")
            }
        }
        .frame(
            width: width,
            height: height
        )
    }

}



struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .frame(
                    width: defaultWidth,
                    height: defaultHeight
                )
                .background(.yellow)

            Text("Hello, world!")
                .padding(0)
                .frame(
                    width: defaultWidth,
                    height: defaultHeight
                )
                .background(.yellow)

            Button(action: {}) {
                ButtonTextView(
                    title: "Text Button",
                    width: defaultWidth,
                    height: defaultHeight
                )
            }
            .buttonStyle(DefaultButtonStyle())

            Button(action: {}) {
                ButtonImageAndTextView(
                    imageAlignment: .left,
                    title: "Image Button",
                    width: defaultWidth,
                    height: defaultHeight
                )
            }
            .buttonStyle(DefaultButtonStyle())

            Button(action: {}) {
                ButtonImageAndTextView(
                    imageAlignment: .right,
                    title: "Image Button",
                    width: defaultWidth,
                    height: defaultHeight
                )
            }
            .buttonStyle(BorderButtonStyle())

            Color.red
                .frame(
                    width: defaultWidth,
                    height: defaultHeight
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
