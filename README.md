# Minimal Boilerplate to Develop Python Small-Medium Sized Projects

I've been coding in Python for a while, and I realised that I always start with the same type of project structure. I like simple and easy things, so I decided to share this simple boilerplate with everyone who wants to start a new project

## Features

### Virtual Environment

The deploy directory includes a simple script to buid a virtual environment to have a clean environment in which work in the project. The script is called `deploy.sh` and it creates a virtual environment in the `.venv` directory. It also installs the requirements specified in the `requirements.txt` file.

### Docker

If needed, you can use the `Dockerfile` to create a docker image of the project. I usually use it to deploy the project in a server. By default, it will expose the API in the port `5566`.

To test it, is needed to have `Docker CE` and `docker-compose` installed. Then, you can run the following command:

```bash
docker-compose up
```

### Logger

I use a simple, beautiful and easy to use logger. It's called `colorlog` and it's available in the `requirements.txt` file. To see an example of how to use it, you can check the `api.py` file, o check author's documentation in [revolunet/colorlog](https://github.com/revolunet/colorlog)

### Tests

Just a directory to store the tests. I usually write tests with `unittest` module, that's what works for me, but you can use whatever you want.

### Source

The `src` directory is where the code is stored. I usually end having to expose and API, so I created an `api.py` and `api_schema.py` to store the API code. The `api.py` file is where the API is defined, and the `api_schema.py` is where the API schema is defined. I always use [FastAPI](https://fastapi.tiangolo.com/) to create the API: it is super simple, they have great documentation and my favorite thing, it generates a swagger documentation with 0 effort.

