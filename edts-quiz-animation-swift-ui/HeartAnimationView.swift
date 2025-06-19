//
//  ExplicitView.swift
//  edts-assignment-klik-product-detail
//
//  Created by Fauzan Sukmapratama on 11/06/25.
//

import SwiftUI

struct HeartAnimationView: View {
    @State private var isLiked = false
    @State private var scale: CGFloat = 0.8
    @State private var rotation = 0.0
    
    var body: some View {
        
        VStack {
            Text("Heart Animated Button")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            VStack(spacing: 16) {
                
                // Heart Button
                Button(action: {
                    
                    withAnimation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1)) {
                        isLiked.toggle()
                        rotation += 360
                        scale = scale == 0.8 ? 1 : 0.8
                    }
                }) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 40))
                        .foregroundColor(isLiked ? .red : .gray8)
                        .opacity(isLiked ? 1.0 : 0.5)
                        .rotationEffect(.degrees(rotation))
                        .frame(width: 80, height: 80)
                        .background(
                            Circle()
                                .fill(isLiked ? Color.red.opacity(0.2) : Color.gray4)
                        )
                }
                .scaleEffect(scale)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: scale)
                
                
                if isLiked {
                    Text("Liked ❤️")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.red)
                        .transition(.asymmetric(
                            insertion: .move(edge: .bottom).combined(with: .opacity),
                            removal: .move(edge: .top).combined(with: .opacity)
                        ))
                    
                    Button(action: {}) {
                        Label("Actived", systemImage: "circle.fill")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .foregroundColor(Color.green)
                            .font(.system(size: 18, weight: .semibold))
                        
                    }
                    
                    Text("Likes: 1")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color.gray8)
                    
                } else {
                    Text("Tap to Like")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color.gray6)
                        .transition(.asymmetric(
                            insertion: .move(edge: .top).combined(with: .opacity),
                            removal: .move(edge: .bottom).combined(with: .opacity)
                        ))
                    
                    Button(action: {}) {
                        Label("Inactive", systemImage: "circle")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .foregroundColor(Color.gray6)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    Text("Likes: 0")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color.gray8)
                }
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isLiked)
            
            Spacer()
        }
        .padding()
    }
    
}

struct HeartAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        HeartAnimationView()
    }
}
