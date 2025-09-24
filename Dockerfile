FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
ENV PORT=5000
EXPOSE 5000

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DB
ARG RDS_HOST
# Define environment variables
ENV MYSQL_USER=$MYSQL_USER \
    MYSQL_PASSWORD=$MYSQL_PASSWORD \
    MYSQL_HOST=$RDS_HOST \
    MYSQL_DB=$MYSQL_DB

CMD ["node", "app.js"]
