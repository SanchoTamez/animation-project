import SwiftUI

// MARK: - Heart Animation (Implicit Animations)
struct HeartAnimationView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    scale = 1.2
                }
            }
    }
}

// MARK: - Circular Loading Indicator
struct CircularLoadingIndicator: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .foregroundColor(.blue)
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

// MARK: - Straight Loading Indicator
struct StraightLoadingIndicator: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 100, height: 10)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

// MARK: - Simple Transition
struct SimpleTransitionView: View {
    @State private var isVisible = true
    
    var body: some View {
        VStack {
            if isVisible {
                Text("Hello, SwiftUI!")
                    .transition(.opacity)
            }
            Button("Toggle Visibility") {
                withAnimation {
                    isVisible.toggle()
                }
            }
        }
    }
}

// MARK: - Phone Frame View for Visualization
struct PhoneFrameView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Phone Frame
            RoundedRectangle(cornerRadius: 40)
                .strokeBorder(Color.black, lineWidth: 4)
                .frame(width: 375, height: 667) // iPhone 8 size
                .background(Color.white)
                .shadow(radius: 10)
            
            // Content inside the phone
            content
                .padding()
        }
        .frame(width: 375, height: 667)
    }
}

// MARK: - ContentView
struct ContentView: View {
    var body: some View {
        PhoneFrameView {
            VStack(spacing: 20) {
                HeartAnimationView()
                CircularLoadingIndicator()
                StraightLoadingIndicator()
                SimpleTransitionView()
            }
            .padding()
        }
    }
}

// MARK: - Preview Configuration
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Preview for iPhone 8
            ContentView()
                .previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8")
            
            // Preview for iPhone 12
            ContentView()
                .previewDevice("iPhone 12")
                .previewDisplayName("iPhone 12")
        }
    }
}

@main
struct AnimationChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

