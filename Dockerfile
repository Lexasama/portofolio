# FROM node:lts-slim

# # installe un simple serveur http pour servir un contenu statique
# RUN npm install -g http-server

# # définit le dossier 'app' comme dossier de travail
# WORKDIR /app

# # copie 'package.json' et 'package-lock.json' (si disponible)
# COPY package*.json ./

# # installe les dépendances du projet
# RUN npm install

# # copie les fichiers et dossiers du projet dans le dossier de travail (par exemple : le dossier 'app')
# COPY . .

# # construit l'app pour la production en la minifiant
# RUN npm run build

# EXPOSE 80
# CMD [ "http-server", "./dist", "-p", "80", "-a", "0.0.0.0" ]



# # étape de build
# FROM node:lts-alpine as build-stage
# WORKDIR /app
# COPY package*.json ./
# # Create the directories we will need
# RUN mkdir -p /tmp/nginx/vue-single-page-app
# RUN mkdir -p /var/log/nginx
# RUN mkdir -p /var/www/html
# COPY nginx_conf/nginx.conf /etc/nginx/nginx.conf
# COPY nginx_conf/default.conf /etc/nginx/conf.d/default.conf

# RUN npm install
# COPY . .
# RUN npm run build


# # copy the built app to our served directory
# RUN cp -r dist/* /var/www/html


# # étape de production
# FROM nginx:stable-alpine as production-stage
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]


# # Create the container from the alpine linux image
# FROM alpine:3.7

# # Add nginx and nodejs
# RUN apk add --update nginx nodejs

# # Create the directories we will need
# RUN mkdir -p /tmp/nginx/vue-single-page-app
# RUN mkdir -p /var/log/nginx
# RUN mkdir -p /var/www/html

# # Copy the respective nginx configuration files
# COPY nginx_conf/nginx.conf /etc/nginx/nginx.conf
# COPY nginx_conf/default.conf /etc/nginx/conf.d/default.conf

# # Set the directory we want to run the next commands for
# WORKDIR /tmp/nginx/vue-single-page-app
# # Copy our source code into the container
# COPY . .
# # Install the dependencies, can be commented out if you're running the same node version
# RUN npm install

# # run webpack and the vue-loader
# RUN npm run build

# # copy the built app to our served directory
# RUN cp -r dist/* /var/www/html

# # make all files belong to the nginx user
# RUN chown nginx:nginx /var/www/html

# # start nginx and keep the process from backgrounding and the container from quitting
# CMD ["nginx", "-g", "daemon off;"]

# build environment
FROM node:14.17.3-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN npm run build

# production environment
FROM nginx:1.16.0-alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx_conf/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
