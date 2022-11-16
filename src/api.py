from fastapi import FastAPI, HTTPException

from . import api_schema as schema

from src import logger
log = logger.setup_logger(file_name='src/app.log')

app = FastAPI()


@app.on_event("startup")
async def startup_event():
    log.info("Starting the application...")


@app.on_event("shutdown")
def shutdown_event():
    log.info("Shutting down the application...")


@app.get("/")
async def root():
    log.info("Someone is requesting a Hello World...")
    return {"message": "Hello World"}
