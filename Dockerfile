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
  "configPath": "/usr/src/app/diachronic-explorer/diachro.json", \
  "dataPath": "/usr/src/app/diachronic-explorer/db/" \
}' > /etc/ezmaster.json

# COPY all files
RUN mkdir -p /usr/src/app/diachronic-explorer
COPY . /usr/src/app/diachronic-explorer

# Set WORDIR
WORKDIR /usr/src/app/diachronic-explorer

# CMD
CMD node serveur.js
