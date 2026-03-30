# !!!! IMPORTANT NOTE !!!!
This repository was moved to [Codeberg](https://codeberg.org/D4uS1/matrix-to-dokku-dockerfile). The github repository is not maintained anymore.

# Dockerfile for Dokku Deployment of matrix.to instance
Matrix.to does not provide a docker image itself to host an own matrix.to instance.

You can use this repo, containing the dockerfile to deploy an own instance, to host an own matrix.to instance using dokku.

If you have an own self hosted element instance, you can pass the build arg ELEMENT_HOST_URL to make the element web instance to the default redirection target.

## Instructions to host matrix.to in dokku
1. Create the dokku app
```
dokku apps:create matrix-to
```

2. Define env to define the url to your self hosted element instance
```
dokku config:set matrix-to ELEMENT_HOST_URL=<your self hosted element domain>
```

3. Set build-arg for docker process. This will cause dokku to replace the build arg ELEMENT_HOST_URL with the same named env variable
```
dokku docker-options:add matrix-to build '--build-arg ELEMENT_HOST_URL'
```

4. deploy by synching this repository
```
dokku git:sync --build matrix-to https://github.com/D4uS1/matrix-to-dokku-dockerfile.git
```

4. set ports
```
dokku ports:add matrix-to http:80:5000
dokku ports:add matrix-to https:443:5000
```

5. Add letsencrypt
* Note that you need the letsencrypt plugin installed
```
dokku letsencrypt:set matrix-to email <your-email>
dokku letsencrypt:enable matrix-to
```
