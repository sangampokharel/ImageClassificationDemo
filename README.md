# 📱 Image Classification using Core ML (MobileNetV2)

This is a simple iOS 18+ SwiftUI application that performs image classification using Apple's Core ML framework and the `MobileNetV2.mlmodel`. The app allows users to select static images from a predefined list and get predictions (label and confidence level) from the Core ML model.

---

## 🚀 Features

- 📷 Uses `MobileNetV2.mlmodel` for image classification
- 🧠 Displays predicted label with confidence score
- 🖼️ Supports static image input
- ✨ Clean SwiftUI interface
- ✅ iOS 18+ support

---


## 🧪 Example Output

<div style="display: flex; gap: 10px;">
    <img src="https://github.com/user-attachments/assets/8e3cfa8b-e6b0-4437-a3ee-f23aaf9b2c35" alt="img1" width="500" />
    <img src="https://github.com/user-attachments/assets/f068f7c1-e945-4e7f-bdb1-1c6428733a8b" alt="img2" width="500" />
   
</div>

---

## 🛠️ Tech Stack

- **Language:** Swift
- **Frameworks:** SwiftUI, CoreML, Vision
- **Model:** `MobileNetV2.mlmodel`
- **Xcode:** 16 or later
- **Deployment Target:** iOS 18.0+

---

## 📸 How It Works

1. User selects an image from a predefined list.
2. The image is passed to the `MobileNetV2` Core ML model.
3. The model returns the most likely classification with a confidence percentage.
4. Results are displayed in a SwiftUI view.

