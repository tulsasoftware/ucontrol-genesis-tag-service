FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
#RUN mkdir ./node-red-data/
#COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.
#COPY settings.js /node-red-data/settings.js
#COPY flows_cred.json /node-red-data/flows_cred.json
#COPY flows.json /node-red-data/flows.json

# You should add extra nodes via your package.json file but you can also add them here:
#WORKDIR /usr/src/node-red
#RUN npm install node-red-node-smooth