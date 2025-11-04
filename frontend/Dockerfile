# Multi-stage build for React Vite application

# Stage 1: Build stage
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy source code
COPY . .

# Build arguments for environment variables
ARG VITE_BACKEND_URL
ARG VITE_API_BASE_URL

# Set environment variables for build
ENV VITE_BACKEND_URL=${VITE_BACKEND_URL}
ENV VITE_API_BASE_URL=${VITE_API_BASE_URL}

# Build the application
RUN yarn build

# Stage 2: Production stage with Nginx
FROM nginx:1.25-alpine

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built assets from build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Create a non-root user
RUN addgroup -S nginx || true && adduser -S nginx -G nginx || true

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80 || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
