import SwiftUI

struct ForestLandscapeView: View {
    var body: some View {
        Canvas { context, size in
            let bounds = CGRect(origin: .zero, size: size)
            context.fill(Path(bounds), with: .color(Color(red: 0.055, green: 0.105, blue: 0.075)))

            // Aerial canopy: deterministic circles create a calm, layered forest texture.
            for layer in 0..<5 {
                let count = 170
                for index in 0..<count {
                    let seed = index * 97 + layer * 131
                    let x = CGFloat((seed * 37) % 1000) / 1000 * size.width
                    let y = CGFloat((seed * 61 + 173) % 1000) / 1000 * size.height
                    let radius = CGFloat(10 + ((seed * 17) % 28)) * min(size.width, size.height) / 900
                    let rect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
                    let greens: [Color] = [
                        Color(red: 0.12, green: 0.23, blue: 0.14),
                        Color(red: 0.17, green: 0.29, blue: 0.17),
                        Color(red: 0.21, green: 0.32, blue: 0.19),
                        Color(red: 0.10, green: 0.19, blue: 0.12),
                        Color(red: 0.25, green: 0.34, blue: 0.21)
                    ]
                    context.fill(Path(ellipseIn: rect), with: .color(greens[(seed + layer) % greens.count].opacity(0.76)))
                    let highlight = CGRect(x: x - radius * 0.45, y: y - radius * 0.5, width: radius * 0.8, height: radius * 0.65)
                    context.fill(Path(ellipseIn: highlight), with: .color(Color.white.opacity(0.035)))
                }
            }

            // Quiet clearing in the upper-right quadrant.
            let clearing = CGRect(x: size.width * 0.64, y: size.height * 0.12,
                                  width: size.width * 0.22, height: size.height * 0.18)
            context.fill(Path(ellipseIn: clearing), with: .color(Color(red: 0.31, green: 0.34, blue: 0.22).opacity(0.8)))

            // A narrow winding stream.
            var stream = Path()
            stream.move(to: CGPoint(x: size.width * 0.12, y: size.height * 0.95))
            stream.addCurve(to: CGPoint(x: size.width * 0.77, y: size.height * 0.03),
                            control1: CGPoint(x: size.width * 0.48, y: size.height * 0.77),
                            control2: CGPoint(x: size.width * 0.31, y: size.height * 0.27))
            context.stroke(stream, with: .color(Color(red: 0.23, green: 0.39, blue: 0.39).opacity(0.8)),
                           style: StrokeStyle(lineWidth: max(5, size.width * 0.006), lineCap: .round))
            context.stroke(stream, with: .color(Color(red: 0.52, green: 0.63, blue: 0.57).opacity(0.22)),
                           style: StrokeStyle(lineWidth: max(1, size.width * 0.0015), lineCap: .round))
        }
        .ignoresSafeArea()
    }
}
