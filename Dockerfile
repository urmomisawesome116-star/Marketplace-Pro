# Use an official Node.js runtime as the base image
FROM node:20-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Cloud Run sets the PORT environment variable. Your app must listen on it.
ENV PORT 8080

# Start the application
CMD [ "npm", "start" ]

