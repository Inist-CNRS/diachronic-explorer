# Get nodejs image
FROM node:argon

# ------------------------------------------------------- #
# INSTALL HERE YOUR PROGRAM DEPENDENCIES (ex below, java) #
# RUN apt-get install -y default-jre                      #
# ------------------------------------------------------- #

# 3000 is your web server listening port
EXPOSE 3000

# Then create the /etc/ezmaster.json in your docker image.
# It will tell to ezmaster where is your web server (ex: port 3000),
# where is your JSON configuration file,
# and where is your data folder
RUN echo '{ \
  "httpPort": 3000, \
  "configPath": "/usr/src/app/istex-demonstrateur/diachro.json", \
  "dataPath": "/usr/src/app/istex-demonstrateur/db/" \
}' > /etc/ezmaster.json

# COPY all files
RUN mkdir /usr/src/app/
COPY . /usr/src/app/

# Set WORDIR
WORKDIR /usr/src/app/istex-demonstrateur

# CMD
CMD node serveur.js
