//
//  HiraganaStudyView.swift
//  HiraganaFeature
//
//  Created by 정진균 on 4/12/24.
//

import ComposableArchitecture
import PencilKit
import SwiftUI
import Vision

struct CanvasView {
    @State var canvasView: PKCanvasView = PKCanvasView()
    @State var toolPicker = PKToolPicker()
    @Binding var drawnImage: UIImage?
    @Binding var text: String?
}

extension CanvasView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
            // canvas
        canvasView.contentSize = CGSize(width: 600, height: 800)
        canvasView.drawingPolicy = .anyInput
        canvasView.minimumZoomScale = 1.0
        canvasView.maximumZoomScale = 1.0
        canvasView.backgroundColor = .black
        canvasView.contentInset = UIEdgeInsets(top: 500, left: 500, bottom: 500, right: 500)
        canvasView.becomeFirstResponder()

            //toolpicker
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.delegate = context.coordinator

        return canvasView
    }

    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: CanvasView
        var count: Int = 0

        init(_ parent: CanvasView) {
            self.parent = parent
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // Get the drawn image from PKCanvasView
            print("!! ca")
            count += 1
            parent.drawnImage = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
        }
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        print("!")
    }
}
public struct HiraganaDetailView: View {
    @State private var drawnImage: UIImage?
    @State private var text: String?
    public let store: StoreOf<HiraganaDetailFeature>

    public var body: some View {
        VStack {
            Button("변환") {
                convert()
            }
            Text("변환된 Text = \(text ?? "")")
            CanvasView(drawnImage: $drawnImage, text: $text)
        }
    }

    public init(store: StoreOf<HiraganaDetailFeature>) {
        self.store = store
    }

    func convert() -> String? {
        guard let drawnImage = drawnImage else { return nil }
        guard let cgImage = drawnImage.cgImage else { return nil }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("Error recognizing text: \(error)")
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("No text recognized.")
                return
            }

            // Combine recognized strings from multiple observations (if any)
//            let recognizedStrings = observations.compactMap { observation in
//                return observation.topCandidates(1).first?.string
//            }
            let text = observations.compactMap({
                    $0.topCandidates(1).first?.string
                }).joined(separator: "\n")
            print("observations = \(observations), text = \(text)")
            self.text = text

            // Process the recognized strings or return the first one
//            if let firstString = recognizedStrings.first {
//                print("firesttring = \(firstString)")
////                return firstString
//                return
//            } else {
//                print("No text recognized.")
//                return
//            }
        }

        let revision3 = VNRecognizeTextRequestRevision3
        request.revision = revision3
        request.recognitionLanguages = ["ja-JP"]
        request.usesLanguageCorrection = true
        request.recognitionLevel = .accurate

        do {
            var possibleLanguages: Array<String> = []
            possibleLanguages = try request.supportedRecognitionLanguages()
            print(possibleLanguages)
        } catch {
            print("Error getting the supported languages.")
        }

        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }

        return nil
    }
}

#Preview {
    let store = Store(
        initialState: HiraganaDetailFeature.State()
    ) {
        HiraganaDetailFeature()
    }
    return HiraganaDetailView(
        store: store
    )
}

