# Use Node with Corepack (Yarn 3+) support
FROM node:18-alpine

# Enable corepack to support Yarn 3+
RUN corepack enable

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY package.json yarn.lock ./
RUN yarn install --immutable

# Copy the rest of the code
COPY . .

# Build the application
RUN yarn build

# Expose port
EXPOSE 3000

# Start the app
CMD ["yarn", "start"]
