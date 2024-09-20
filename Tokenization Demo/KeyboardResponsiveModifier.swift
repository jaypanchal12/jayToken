import SwiftUI

struct KeyboardResponsiveModifier: ViewModifier {
    @State private var currentOffset: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, currentOffset)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        withAnimation {
                            currentOffset = keyboardFrame.height - geometry.safeAreaInsets.bottom
                        }
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                    withAnimation {
                        currentOffset = 0
                    }
                }
        }
    }
}


extension View {
    func keyboardAwarePadding() -> some View {
        self.modifier(KeyboardResponsiveModifier())
    }
}
