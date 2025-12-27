# FlexiFlow  
## An AI-Powered Personalized Support System for Arthritis Management

FlexiFlow is an intelligent mobile and web-based application designed to support individuals with arthritis through **personalized exercise recommendations**, **smart medication reminders**, and **community-driven engagement**. The system leverages **AI-based contextual learning** to adapt to user behavior and improve adherence over time.

🔗 **Live Application**: https://flexiflow-9be51.web.app/

---

## 🚀 Features

- **AI-Powered Personalized Exercise Plans**
  - Context-aware recommendations based on pain level, arthritis type, mood, and engagement
  - Uses a **LinUCB contextual bandit algorithm** for adaptive learning
  - Cold-start handled using **EULAR guideline-based exercises**

- **Smart Medication Reminders**
  - Categorized alerts: Upcoming, Due, Overdue, Missed
  - Offline-capable local notifications

- **Pain & Activity Tracking**
  - Daily pain logging and symptom monitoring
  - Visual progress tracking over time

- **Gamification**
  - Streak tracking and achievement badges
  - Encourages long-term consistency

- **Community Forum**
  - Peer-to-peer support and discussions
  - Offensive language filtering for safety

- **Cross-Platform Support**
  - Android and Web deployment

---

## 🧠 AI & Recommendation Engine

FlexiFlow uses a **hybrid recommendation strategy**:

### Cold Start Phase
- Exercise recommendations based on **EULAR clinical guidelines**
- Ensures safe and relevant suggestions for new users

### Adaptive Phase
- **LinUCB Contextual Bandit Model**
- Learns from:
  - Pain levels
  - User engagement
  - Feedback (implicit & explicit rewards)
- Continuously updates recommendations for personalization

---

## 🛠️ Tech Stack

### Frontend
- Flutter (Android & Web)
- Firebase Authentication
- Responsive UI

### Backend
- FastAPI (Python)
- RESTful APIs
- Hosted on Render

### Database & Cloud
- Firebase Firestore (NoSQL)
- Firebase Hosting

### AI / ML
- Python
- LinUCB Contextual Bandit Algorithm
- Rule-based clinical logic (EULAR)
- Model persistence using Pickle

---

## 📊 Performance Highlights

- API response time: **300–500 ms**
- Screen transitions: **< 1 second**
- Real-time data sync via Firebase
- Smooth performance on low-end devices
- Improved engagement through AI adaptation and gamification

---

## 🌱 Future Scope

- Deeper AI personalization using advanced ML models
- Wearable and sensor-based integration
- Offline-first capabilities
- Multilingual support
- Teleconsultation features
- Integration with Electronic Health Records (EHR)

---

## 📄 Documentation

For detailed system design, methodology, and results, refer to the project report:  
**FlexiFlow: An AI-Powered Personalized Support System for Arthritis Management**

---

⭐ If you find this project useful, feel free to star the repository!
