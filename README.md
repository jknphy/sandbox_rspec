## Brief instructions:
- Clone this repo.

- Install docker in your system.

- Build docker image:

```
docker build -t my-ruby-app .
```
- Edit your spec files in your local environment.

- Run the container sharing spec folder:

```
docker run --rm -v "$PWD/spec":/usr/src/app/spec -it --entrypoint bash my-ruby-app
```

- Run rspec from inside the container:

```
bundle exec rspec
```

*Note*: rspec colored output is not displayed if running directly with:

```
docker run --rm -v "$PWD/spec":/usr/src/app/spec my-ruby-app bundle exec rspec
```
