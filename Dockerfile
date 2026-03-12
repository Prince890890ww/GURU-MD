# Base image with npm included
FROM node:20-bullseye-slim

# System dependencies install kar
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Verify npm install hai
RUN node --version && npm --version

# Set working directory
WORKDIR /usr/src/app

# Permissions sahi kar
RUN chown -R node:node /usr/src/app
USER node

# Copy package.json and install dependencies
COPY --chown=node:node package*.json ./
RUN npm install

# Copy application source code
COPY --chown=node:node . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
