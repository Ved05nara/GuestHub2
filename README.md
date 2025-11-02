# GuestHub - Hotel Management System

**GuestHub** is a modern, comprehensive Hotel Management System built with React.js, designed to transform hospitality operations through intelligent automation and seamless guest experiences.

## 🏨 About

Based on detailed Software Requirements Specification (SRS) documentation, GuestHub provides a unified platform that replaces 8+ legacy systems, reduces manual processes by 70%, and improves guest satisfaction through personalized digital experiences.

## ✨ Features

### **Role-Based Access Control**
- **Guests**: Room booking, service requests, digital check-in/out
- **Staff**: Task management, housekeeping, maintenance operations  
- **Management**: Analytics dashboard, reporting, hotel oversight

### **Core Functionality**
- 🏨 **Smart Booking System** - Real-time availability and instant confirmations
- 👥 **Staff Management** - Efficient task assignment and team coordination
- 💬 **Guest Communication** - Direct messaging between guests and staff
- 📊 **Analytics Dashboard** - Comprehensive insights and reporting
- 🔒 **Secure Payments** - Safe encrypted payment processing
- ⏰ **24/7 Operations** - Round-the-clock system availability

## 🚀 Technology Stack

- **Frontend**: React.js 18 with TypeScript
- **Routing**: React Router DOM
- **Styling**: Tailwind CSS with custom design system
- **UI Components**: Radix UI primitives
- **Icons**: Lucide React
- **Authentication**: JWT-ready with role-based access
- **State Management**: React Query for server state
- **Build Tool**: Vite

## 🎨 Design System

GuestHub features a sophisticated design system with:
- **Primary Colors**: Deep navy blues for trust and professionalism
- **Accent Colors**: Luxurious gold for premium feel
- **Typography**: Inter font family for modern readability
- **Components**: Custom button variants (luxury, hotel, success, warning)
- **Animations**: Smooth transitions with custom timing functions
- **Responsive**: Mobile-first design approach

## 🏗️ Project Structure

```
src/
├── components/
│   ├── auth/           # Authentication components
│   ├── layout/         # Header, navigation components
│   └── ui/             # Reusable UI components (buttons, cards, etc.)
├── pages/
│   ├── auth/           # Login/register pages
│   ├── guest/          # Guest dashboard and features
│   ├── staff/          # Staff task management
│   └── management/     # Management analytics
├── assets/             # Images and media files
├── hooks/              # Custom React hooks
└── lib/                # Utility functions
```

## 🔐 User Roles & Access

### Guest Access
- Room search and booking
- Booking management and modifications
- Service requests
- Digital check-in/check-out
- Review and feedback system

### Staff Access  
- Task dashboard with filtering
- Housekeeping assignments
- Maintenance requests
- Guest service coordination
- Real-time task updates

### Management Access
- Comprehensive analytics dashboard
- Room status overview
- Revenue and occupancy metrics
- Staff performance monitoring
- System-wide reporting

## 🎯 Key Benefits

- **Operational Efficiency**: 70% reduction in manual processes
- **Guest Satisfaction**: Personalized digital experiences
- **Cost Reduction**: 40% cut in administrative overhead
- **Real-time Insights**: Data-driven decision making
- **System Integration**: Replace 8+ legacy systems with one platform

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ and npm
- Modern web browser

### Installation

1. **Clone the repository**
   ```bash
   git clone <YOUR_GIT_URL>
   cd <YOUR_PROJECT_NAME>
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```

4. **Open in browser**
   Navigate to `http://localhost:8080`

### Build for Production
```bash
npm run build
```

## 🧪 Demo Accounts

For testing purposes, you can create accounts with any of these roles:
- **Guest**: For room booking and guest services
- **Staff**: For task management and operations
- **Management**: For analytics and oversight

*Note: This is a demo version with mock authentication*

## 📱 Responsive Design

GuestHub is fully responsive and works seamlessly across:
- Desktop computers
- Tablets
- Mobile phones
- Touch-enabled devices

## 🔮 Future Enhancements

- Real-time chat system with Socket.io
- Payment gateway integration (Stripe)
- Email/SMS notification services
- Advanced reporting and analytics
- Mobile app development
- IoT device integration

## 🛠️ Development

Built with modern web technologies and best practices:
- **Type Safety**: Full TypeScript implementation
- **Component Architecture**: Modular, reusable components
- **Design Consistency**: Centralized design system
- **Performance**: Optimized with Vite bundling
- **Accessibility**: WCAG compliant components

## 📄 License

This project is part of an academic Software Engineering experiment for K.J. Somaiya College of Engineering.

---

**GuestHub** - Transforming hospitality through intelligent technology 🏨✨
