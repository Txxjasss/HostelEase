# HostelEase

- HostelEase is an iOS application built with SwiftUI that simplifies the hostel room allocation process.  
- It allows students to log in with their roll number and branch, view available rooms, allocate a room, make payments via a QR code, and log out safely.  
- The app ensures that each student can only have one room at a time and provides a simple and secure logout flow.  

---

## Project Details

- Built as a college project to demonstrate how SwiftUI can be used to create a real-world utility app.  
- Students can log in, check available rooms with occupancy details, and allocate a room if space is available.  
- Allocated room information is saved locally using AppStorage so it persists after app restarts.  
- Includes a **PaymentView** with a generated QR code for secure payment handling.  
- Includes a **LoggingOutView** that handles the logout process smoothly by clearing stored data and redirecting back to login.  

---

## How It’s Made

- **SwiftUI** is used to design the user interface with a modern and responsive layout.  
- **NavigationStack** and **NavigationLink** handle navigation between multiple screens.  
- **AppStorage (UserDefaults)** is used to persist data such as the student’s allocated room.  
- **PaymentView** generates a QR code for room fee payment.  
- **LogOutView** provides a smooth logout experience, ensuring the allocated room data is cleared.  

---

## Tech Stack

- **Language:** Swift 5+  
- **Framework:** SwiftUI  
- **Storage:** AppStorage (UserDefaults)  
- **IDE:** Xcode  

---

## Demo Flow

1. **Login Screen** – Students enter roll number and branch to access the app.  
2. **Dashboard** – Displays a personalized welcome message and the list of rooms with occupancy details.  
3. **Room Detail View** – Students can view room details and allocate a room if space is available.  
4. **Payment View** – A QR code is generated for students to complete their payment, also has a
LogutOutView - Ensures data is cleared and securely redirects students back to the login screen.

---

## Working Demo

<img width="403" height="840" alt="Screen1" src="https://github.com/user-attachments/assets/3c987360-0f7f-4230-a1ec-8134dd41ff76" />
<img width="397" height="846" alt="Screen2" src="https://github.com/user-attachments/assets/4efb3337-3f3f-456a-8fbe-be982cdc5393" />
<img width="385" height="846" alt="Screen3" src="https://github.com/user-attachments/assets/3525072a-a01c-499c-be3d-da43919bfeaa" />
<img width="379" height="838" alt="Screen4" src="https://github.com/user-attachments/assets/69ce8b62-d53a-4eb1-a073-d65c49136bad" />
<img width="390" height="833" alt="Screen5" src="https://github.com/user-attachments/assets/0ddbbb0d-e716-4485-a84d-a30f09927d00" />
<img width="418" height="841" alt="Screen6" src="https://github.com/user-attachments/assets/7b568646-4be3-4cfe-bfe1-83341a6d30be" />
