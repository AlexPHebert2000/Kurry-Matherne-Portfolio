FROM node:22 AS build

WORKDIR /app

COPY . ./

COPY package.json /app/
COPY package-lock.json /app/
RUN npm install

RUN npx prisma generate

RUN npm run build

RUN rm -rf src/ tests/ static/ Dockerfile

CMD ["node","build/index.js"]