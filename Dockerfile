FROM node:alpine as ALPHATeam
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx as BETATeam
EXPOSE 80
COPY --from=ALPHATeam /var/app/build /usr/share/nginx/html


