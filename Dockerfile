# Dockerfile for wa-gateway-app (multi-session)
# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Expose port (ganti sesuai port app jika perlu)
EXPOSE 3000

# Set environment variables for multi-session (edit as needed)
ENV NODE_OPTIONS="--max_old_space_size=2048"
ENV SESSION_COUNT=4

# Start app (edit sesuai entry point)
CMD ["pnpm", "start"]
