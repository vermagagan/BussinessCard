# 🪪 Personal Business Card App — iOS App

> App #1 of my iOS Development Journey | Built with Swift + UIKit | Zero Storyboards

---

## 📱 Overview

Personal Business Card is a fully programmatic iOS app that digitizes your professional identity. Users can view their card, interact with contact details, and edit all information — with everything persisting across app restarts. Built as part of my structured iOS curriculum to master programmatic Auto Layout, UIStackView, modal presentation, and UserDefaults persistence.

---

## 🖥️ Screens

### 🪪 Main Card Screen
- Circular profile photo with blue border + banner image at the top
- Name, designation, and company labels
- Action buttons — Phone, Email, LinkedIn, GitHub
- Edit button to push the edit screen

### 📞 Phone Modal
- Shows saved phone number
- **Copy to Clipboard** button with auto-dismiss confirmation alert
- **Call** button that opens the native dialer via `tel://` URL scheme

### 📧 Email Modal
- Shows saved email address
- **Copy to Clipboard** button with auto-dismiss confirmation alert
- **Send Mail** button that opens Mail app via `mailto://` URL scheme

### ✏️ Edit Screen
- Text fields to update name, designation, company, phone, email, LinkedIn, GitHub
- Pushed via `UINavigationController`
- Changes saved to `UserDefaults` on save
- Card auto-refreshes when returning via `viewWillAppear`

---

## ⚙️ Features

| Feature | Detail |
|---|---|
| Circular profile photo | `UIImageView` with `cornerRadius` timed via `viewDidAppear` |
| Copy to clipboard | `UIPasteboard` with auto-dismiss `UIAlertController` |
| Call & email | Native URL schemes — `tel://`, `mailto://` |
| LinkedIn & GitHub | Opens in Safari via `https://` URL scheme |
| Data persistence | All card data saved + loaded via `UserDefaults` |
| Live card refresh | `viewWillAppear` re-loads data every time card is shown |
| SF Symbols | All buttons use `UIButton.Configuration` with SF Symbols |

---

## 🛠️ Tech Stack

- **Language:** Swift
- **Framework:** UIKit
- **UI Approach:** 100% Programmatic — Zero Storyboards
- **Layout:** `NSLayoutConstraint` + `UIStackView`
- **Persistence:** `UserDefaults`
- **Clipboard:** `UIPasteboard`
- **URL Schemes:** `tel://`, `mailto://`, `https://`
- **Navigation:** `UINavigationController` push + Modal presentation (`.pageSheet`)
- **Buttons:** `UIButton.Configuration` with SF Symbols

---

## 🧠 Concepts Practiced

| Concept | Where Used |
|---|---|
| Programmatic Auto Layout | Every screen |
| `UIStackView` nesting | All files |
| `UIImageView` circular masking | Profile photo |
| `UIButton.Configuration` | All buttons |
| Modal present + dismiss | Phone, Email screens |
| Navigation push + pop | Edit screen |
| `UserDefaults` read/write | Edit + ViewController |
| URL schemes | Call, Email, LinkedIn, GitHub |
| `UIAlertController` | Copy confirmation |
| `viewWillAppear` refresh | ViewController |
| `viewDidAppear` layout timing | Circular photo fix |

---


## 🚀 Getting Started

1. Clone the repo
   ```bash
   git clone https://github.com/YOUR_USERNAME/BusinessCard-iOS.git
   ```
2. Open `BusinessCard.xcodeproj` in Xcode
3. Run on Simulator (iOS 16+)

> No third-party dependencies. No CocoaPods. Pure UIKit.


---

## 👨‍💻 Author

**Gagan**
Aspiring iOS Developer | Building in public

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/vermagagan)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/vermagagan)

---

> *"Every pixel placed in code. This was the app that made Auto Layout finally click."*
