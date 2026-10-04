# Use Official Node.js 16 image
from node:18-alpine

# Create app directory inside the container
WORKDIR /src/app

# Copy package.json and package-lock.json first 
COPY package*.json ./

# Install app dependencies
RUN npm install

# copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]