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

The `src` directory is where the code is stored. 

### API

I usually end having to expose and API, so I created an `api.py` and `api_schema.py` to store the API code. The `api.py` file is where the API is defined, and the `api_schema.py` is where the API schema is defined. I always use [FastAPI](https://fastapi.tiangolo.com/) to create the API: it is super simple, they have great documentation and my favorite thing, it generates a swagger documentation with 0 effort.

To run the API, just make sure you answer `"y"` to the question `Do you want to run the API?` when you run the `./deploy/venv.sh` script. Then, you can run the API by `uvicorn src.api:app --reload` and access it in `http://localhost:8000/docs` URL (URL by default).

For more info, check the [FastAPI documentation](https://fastapi.tiangolo.com/). It's simple, complete and easy to follow.

## How to use it

### Running Code

The best way I find to run code in order to avoid weir import errors is to run the python module with the `-m` flag. For example, if you want to run the `api.py` file, you can run the following command:

```bash
python -m src.api
```

The reasoning behind that is well explained in this [PythonPathSadness wiki page](https://github.com/asottile/scratch/wiki/PythonPathSadness), also better explained in [video form](https://www.youtube.com/watch?v=hgCVIa5qQhM)

### ⚠ Importing Modules ⚠

⚠ **Very important** ⚠, I have had a lot of trouble with weird import errors. So far, the best way I found to import modules in the same project, is to use the `from path import module` syntax. For example, if you want to import the `api_schema.py` file in the `api.py` file, you can do it like this:

```python
# We are in api.py file
from src import api_schema
```

In two-level depth directories, you can do it like follows. Let's assume the following project directory tree inside `src`:

```source
src
├── api.py
├── api_schema.py
├── app.log
├── core
│   ├── cool_core_module.py
│   └── __init__.py
├── init.py
└── logger.py
```

We are in `api.py` file, and we want to import the `cool_core_module.py` file. We can do it like this:

```python
# We are in api.py file

# Importing the core module
from src.core import cool_core_module
```

Last, but not least, make sure that every file has the `__init__.py` file. This is needed to make Python treat the directories as containing packages. I've read about that trying to understand the behaviour, but due to the fact that I don't really have good memory and the fact that its effect changes between python versions, I always end up adding the `__init__.py` file to every directory.

So far, this is the approach that works for me. I have been struggling to find a "propper" way to structure python projects. The best thing that I found, is to check big open-source projects, like [Django](https://github.com/django/django) or [Keras](https://github.com/keras-team/keras) and see how they structure their projects.

However, I'm constantly learning, so if you have any suggestion, please let me know.
