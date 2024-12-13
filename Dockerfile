FROM node:14.15.0-alpine

# Install yarn
RUN RUN apk add --no-cache g++ make python2 && \
    ADD -o- -L https://yarnpkg.com/install.sh | bash

# Add yarn to the PATH
ENV PATH="/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:${PATH}"

WORKDIR /app
COPY . .

# Install dependencies using yarn
RUN yarn install --production

CMD ["node", "src/index.js"]
EXPOSE 3000
