FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED


COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

USER node-red

COPY cloudantStorage.js .
# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.

COPY settings.js /data/settings.js
COPY default/ /data/default/
COPY static/ /data/static
