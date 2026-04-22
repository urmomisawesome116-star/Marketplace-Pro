# 1. Use a lightweight version of Node.js
FROM node:20-slim

# 2. Create and change to the app directory
WORKDIR /usr/src/app

# 3. Copy application dependency manifests to the container image.
# Using 'package*.json' copies both package.json AND package-lock.json.
COPY package*.json ./

# 4. Install production dependencies.
# 'npm ci' ensures the exact versions in your lockfile are installed.
RUN npm ci --only=production

# 5. Copy local code to the container image.
COPY . .

# 6. Run the web service on container startup.
# Cloud Run will tell your app which port to use via the $PORT variable.
CMD [ "npm", "start" ]

