FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Copy dependency files first (better Docker layer caching)
COPY package*.json ./

# Install production dependencies
RUN npm install

# Copy the rest of the Strapi project
COPY . .

# Build Strapi admin panel
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Use NODE_ENV to determine which command to run
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"production\" ]; then npm run start; else npm run develop; fi"]
