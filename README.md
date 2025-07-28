# 🎫 Virtual Membership Card App

This Flutter application simulates a **digital membership card** that can be flipped between a front (user info) and back (QR code). It mimics a physical card experience with clean UI, dynamic QR generation, and smooth interaction.

<br/>

## 📱 Features

- 🪪 **Front of Card**:
  - User Name (e.g., Alex Ray)
  - Membership Level (e.g., Platinum Member)
  - Circular Profile Placeholder
- 🔄 **Back of Card**:
  - Dynamically generated QR code (based on user ID + timestamp)
  - "Refresh QR" button to update the QR data
- 📟 **Flip Animation**:
  - Swipe or tap to flip between front and back sides
- 🎨 **Design**:
  - Matches realistic card design with a dark theme

<br/>

## 🚀 Tech Stack

- [Flutter](https://flutter.dev)
- [qr_flutter](https://pub.dev/packages/qr_flutter) – QR code generation
- [flip_card](https://pub.dev/packages/flip_card) – Card flipping animation

<br/>

## 📸 Demo

| Front (User Info) | Back (QR Code) |
|-------------------|----------------|
| ![Front](assets/front.png) | ![Back](assets/back.png) |

> 💡 Tip: Tap or swipe the card to flip!

<br/>

## 🧪 How to Run

### 1. Clone the repository
```bash
git clone https://github.com/your-username/virtual-membership-card.git
cd virtual-membership-card
