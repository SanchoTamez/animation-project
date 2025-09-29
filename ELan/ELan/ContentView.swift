import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Animations Challenge")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HeartAnimationView()
                CircularLoadingIndicator()
                StraightLoadingIndicator()
                SimpleTransitionView()
                CombinedTransitionView()
            }
            .padding()
        }
    }
}

struct HeartAnimationView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text("❤️ Heart Animation")
                .font(.headline)
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .scaleEffect(scale)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        scale = scale == 1.0 ? 1.3 : 1.0
                    }
                }
        }
    }
}

struct CircularLoadingIndicator: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        VStack {
            Text("🔄 Circular Loading")
                .font(.headline)
            
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(lineWidth: 6)
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
        }
    }
}

struct StraightLoadingIndicator: View {
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text("⬜ Straight Loading")
                .font(.headline)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200, height: 10)
                    .foregroundColor(.gray.opacity(0.3))
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200 * progress, height: 10)
                    .foregroundColor(.green)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                progress = 1.0
            }
        }
    }
}

struct SimpleTransitionView: View {
    @State private var showText = false
    
    var body: some View {
        VStack {
            Text("➡️ Simple Transition")
                .font(.headline)
            
            Button("Toggle Text") {
                withAnimation {
                    showText.toggle()
                }
            }
            .padding()
            
            if showText {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .padding()
                    .transition(.slide)
            }
        }
    }
}

struct CombinedTransitionView: View {
    @State private var showBox = false
    
    var body: some View {
        VStack {
            Text("🎭 Combined Transition")
                .font(.headline)
            
            Button("Toggle Box") {
                withAnimation {
                    showBox.toggle()
                }
            }
            .padding()
            
            if showBox {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .frame(width: 150, height: 150)
                    .transition(.asymmetric(
                        insertion: .scale.combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    ))
            }
        }
    }
}

#Preview {
    ContentView()
}

