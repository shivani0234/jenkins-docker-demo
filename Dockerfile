# Use an official Node.js runtime as a parent image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies (if any)
COPY package*.json ./
RUN npm install

# Copy app source code
COPY . .

# Expose port (if your app uses one)
EXPOSE 3000

# Command to run your app (change as needed)
CMD ["node", "app.js"]
