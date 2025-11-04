# 🐳 Docker Deployment Guide for GuestHub

Complete guide for running GuestHub using Docker and Docker Compose.

---

## 📋 Prerequisites

- Docker 20.10+
- Docker Compose 2.0+

**Install Docker:**
- [Windows/Mac](https://www.docker.com/products/docker-desktop)
- [Linux](https://docs.docker.com/engine/install/)

---

## 🚀 Quick Start

### 1. Clone & Setup
```bash
git clone https://github.com/Ved05nara/to-style.git
cd to-style
cp .env.example .env
```

### 2. Start All Services
```bash
docker-compose up -d
```

### 3. Check Status
```bash
docker-compose ps
```

### 4. View Logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f mongodb
```

### 5. Access Application
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8001/api
- **Swagger:** http://localhost:8001/api/swagger-ui.html

---

## 🛠️ Docker Commands

### **Start Services**
```bash
# Start in background
docker-compose up -d

# Start in foreground (see logs)
docker-compose up

# Start specific service
docker-compose up -d backend
```

### **Stop Services**
```bash
# Stop all
docker-compose down

# Stop and remove volumes (deletes data!)
docker-compose down -v

# Stop specific service
docker-compose stop backend
```

### **Restart Services**
```bash
# Restart all
docker-compose restart

# Restart specific service
docker-compose restart backend
```

### **Rebuild Services**
```bash
# Rebuild all
docker-compose build

# Rebuild specific service
docker-compose build backend

# Rebuild and start
docker-compose up -d --build
```

### **View Logs**
```bash
# All services
docker-compose logs

# Follow logs (real-time)
docker-compose logs -f

# Last 100 lines
docker-compose logs --tail=100

# Specific service
docker-compose logs -f backend
```

### **Execute Commands in Container**
```bash
# Backend shell
docker-compose exec backend sh

# Frontend shell
docker-compose exec frontend sh

# MongoDB shell
docker-compose exec mongodb mongosh guesthub_db
```

---

## 🔧 Configuration

### **Environment Variables (.env)**
```bash
# Backend
JWT_SECRET=your-super-secret-jwt-key-change-in-production
SPRING_PROFILES_ACTIVE=default

# Frontend
VITE_BACKEND_URL=http://localhost:8001
VITE_API_BASE_URL=http://localhost:8001/api
```

### **Port Mapping**
- Frontend: `3000:80`
- Backend: `8001:8001`
- MongoDB: `27017:27017`

To change ports, edit `docker-compose.yml`:
```yaml
services:
  frontend:
    ports:
      - "8080:80"  # Change 3000 to 8080
```

---

## 📊 Health Checks

All services have health checks configured:

```bash
# Check health status
docker-compose ps

# Detailed health info
docker inspect guesthub-backend --format='{{json .State.Health}}'
```

---

## 💾 Data Persistence

MongoDB data is persisted in Docker volumes:

```bash
# List volumes
docker volume ls

# Inspect volume
docker volume inspect to-style_mongodb_data

# Backup database
docker-compose exec mongodb mongodump --db guesthub_db --out /backup

# Restore database
docker-compose exec mongodb mongorestore --db guesthub_db /backup/guesthub_db
```

---

## 🐛 Troubleshooting

### **Ports Already in Use**
```bash
# Find process using port 8001
lsof -i :8001
# or
netstat -tulpn | grep 8001

# Kill the process
kill -9 <PID>
```

### **Backend Won't Start**
```bash
# Check logs
docker-compose logs backend

# Rebuild image
docker-compose build backend
docker-compose up -d backend

# Check MongoDB connection
docker-compose exec backend sh
wget http://mongodb:27017
```

### **Frontend Won't Load**
```bash
# Check logs
docker-compose logs frontend

# Rebuild image
docker-compose build frontend
docker-compose up -d frontend

# Verify environment variables
docker-compose exec frontend env | grep VITE
```

### **MongoDB Connection Issues**
```bash
# Check if MongoDB is running
docker-compose ps mongodb

# Check MongoDB logs
docker-compose logs mongodb

# Test connection
docker-compose exec mongodb mongosh guesthub_db --eval "db.stats()"
```

### **Clear Everything and Start Fresh**
```bash
# Stop and remove everything
docker-compose down -v

# Remove images
docker-compose down --rmi all

# Clean system
docker system prune -a

# Start again
docker-compose up -d --build
```

---

## 🔄 Updates & Maintenance

### **Update Application Code**
```bash
# Pull latest changes
git pull

# Rebuild and restart
docker-compose up -d --build
```

### **Update Base Images**
```bash
# Pull latest base images
docker-compose pull

# Rebuild
docker-compose up -d --build
```

### **Backup Before Updates**
```bash
# Backup database
docker-compose exec mongodb mongodump --db guesthub_db --out /backup

# Copy backup to host
docker cp guesthub-mongodb:/backup ./mongodb-backup
```

---

## 📈 Production Deployment

### **Recommended Changes for Production**

1. **Update Environment Variables**
```bash
JWT_SECRET=$(openssl rand -base64 32)
SPRING_PROFILES_ACTIVE=production
```

2. **Add Resource Limits**
```yaml
services:
  backend:
    deploy:
      resources:
        limits:
          cpus: '2'
          memory: 2G
```

3. **Enable HTTPS**
- Use reverse proxy (Nginx, Traefik)
- Configure SSL certificates
- Update CORS settings

4. **MongoDB Security**
```yaml
mongodb:
  environment:
    MONGO_INITDB_ROOT_USERNAME: admin
    MONGO_INITDB_ROOT_PASSWORD: strong_password
```

5. **Logging**
```yaml
services:
  backend:
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```

---

## 📦 Docker Images

### **Build Individual Images**

**Backend:**
```bash
cd backend
docker build -t guesthub-backend:latest .
```

**Frontend:**
```bash
cd frontend
docker build -t guesthub-frontend:latest \
  --build-arg VITE_BACKEND_URL=http://localhost:8001 \
  --build-arg VITE_API_BASE_URL=http://localhost:8001/api .
```

### **Push to Registry**
```bash
# Tag images
docker tag guesthub-backend:latest username/guesthub-backend:latest
docker tag guesthub-frontend:latest username/guesthub-frontend:latest

# Push to Docker Hub
docker push username/guesthub-backend:latest
docker push username/guesthub-frontend:latest
```

---

## 🎯 Best Practices

1. ✅ Always use `.env` for sensitive data
2. ✅ Keep Docker images updated
3. ✅ Monitor logs regularly
4. ✅ Backup database before updates
5. ✅ Use volume mounts for development
6. ✅ Implement health checks
7. ✅ Set resource limits in production
8. ✅ Use multi-stage builds for smaller images

---

## 📚 Useful Commands Cheatsheet

```bash
# Start
docker-compose up -d

# Stop
docker-compose down

# Rebuild
docker-compose up -d --build

# Logs
docker-compose logs -f

# Shell access
docker-compose exec backend sh
docker-compose exec frontend sh
docker-compose exec mongodb mongosh

# Database backup
docker-compose exec mongodb mongodump --db guesthub_db

# System cleanup
docker system prune -a

# Check resource usage
docker stats
```

---

**Happy Dockerizing! 🐳**
