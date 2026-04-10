[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/dq6pKgp_)
# 📝 Assignment: "Meet A Flora !" 🌿✨

Welcome to the **Meet A Flora** project. In this assignment, you are tasked with building a high-standard Flutter application that integrates AI capabilities with professional software engineering practices.

## 🎯 Project Overview
The goal is to create an app that identifies plants via images or camera and provides dynamic, auto-generated botanical data. 

---

## 📱 User Interface & Flow (Two-Page Requirement)

Your application must consist of exactly two main screens with the following logic:

### **Page 1: Discovery & Scanning**
* **Scan Feature:** Access the mobile camera to identify a plant in real-time.
##OR
* **Plant List:** A pre-defined list/gallery of various plants for users to choose from.
* **Goal:** The user must be able to either "Capture" a new plant or "Select" one from the existing collection.

### **Page 2: Dynamic Plant Details**
* **Dynamic Content:** When a plant is selected or scanned, this page must display its details.
* **The "Fresh Data" Condition:** The information (care tips, facts, etc.) must be **auto-generated/refreshed** every single time the user enters the page. The data should not be static or repeated; it must demonstrate dynamic fetching or AI-generation.

---

## 🚀 Required Features (Functional Requirements)

* **AI Plant Recognition:** Use AI to identify plants from the gallery or live camera feed.
* **Dynamic Information:** All plant data must be fetched dynamically to ensure unique content on every visit.
* **Camera Integration:** High-performance implementation for seamless identification.
* **Advanced Error Handling:** A system that handles both logic errors and network failures using the **Failure Concept**.

---

## 🏗️ Technical Constraints & Architecture

### **The Clean Architecture Pattern**
The most critical requirement is the strict implementation of **Clean Architecture**. Your code must demonstrate:
* **Independence:** Business logic (Domain) must be decoupled from the UI and Data sources.
* **Abstraction:** Use abstract repositories to handle data flow.
* **Scalability:** Design the app so that adding new AI models or data sources doesn't break the UI.

### **State Management: BLoC**
* Use **BLoC** to manage transitions between `Initial`, `Loading`, `Success`, and `Failure` states.
* Ensure the "Dynamic Refresh" logic on the second page is handled through appropriate BLoC events.

### **Networking & Routing**
* **Dio:** Use Dio with interceptors for all API communication.
* **GoRouter:** Implement declarative routing to pass plant data between Page 1 and Page 2.

---

## 🛡 Error Handling Standards

> ⚠️ **Note:** Generic `try-catch` blocks in the UI are strictly prohibited.

* Use the **Either Pattern** to return results.
* Map all exceptions to specific **Failure** objects (e.g., `ServerFailure`, `CameraFailure`).

---

## 📝 Submission Guidelines
1.  **Code Quality:** Adherence to  **Clean Code**.
2.  **Architecture:** Clear separation between Domain, Data, and Presentation layers.
3.  **UX:** The "Dynamic Info" must feel fast and responsive.

**Good luck with your Coding! 🚀**
