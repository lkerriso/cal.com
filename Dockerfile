# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the rest of the code
COPY . .

# Build the application
RUN yarn build

# Expose port
EXPOSE 3000

# Start the app
CMD ["yarn", "start"]
