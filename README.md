# eea.docker.postgis - tag v9.6_2.3

PostgreSQL 9.6 with PostGIS 2.3
 
running the container with docker-compose will make you life easy.

## docker-compose.yml setup

setting the environment variables for certificates is mandatory.
setting the variable for pg_hba is mandatory as well.

## Release to production

The production deployment is not made with `git clone` and `docker-compose build`.
Instead it pulls a tagged image from Docker Hub.  When you have tested your changes
and are satisfied, then you must push a new image up with a new version number that
follows [semantic versioning](http://semver.org/) principles.  Here is how you do it:

Therefore, if happy with master:

    version=$(cat VERSION.txt)
    git tag -a $version -m "Tagging the $version release of the 'eeacms/postgis' Docker image."
    git commit -m "release of version $version"
    git push origin $version

The purpose of the procedure is to be able to redeploy the exact same image on a
new host, and to be able to roll back one or more versions if the deployment has problems.
