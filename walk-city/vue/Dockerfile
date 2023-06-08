# syntax = docker/dockerfile:1.2
FROM node:16

#install new stuff

#RUN npm i @babel/eslint-parser
#RUN npm install eslint @babel/core @babel/eslint-parser --save-dev
#make sure vue plug-ins 5.0.8



# install simple http server for serving static content

RUN npm install -g http-server



# make the 'app' folder the current working directory

WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)

COPY package\*.json ./

# install project dependencies

RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)

COPY . .

# mount secrets
# build app for production with minification


RUN --mount=type=secret,id=VUE_APP_REMOTE_API \
    --mount=type=secret,id=VUE_APP_GOOGLE_API_KEY \
    VUE_APP_REMOTE_API="$(cat /run/secrets/VUE_APP_REMOTE_API)" \
    VUE_APP_GOOGLE_API_KEY="$(cat /run/secrets/VUE_APP_GOOGLE_API_KEY)" \
    npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]
