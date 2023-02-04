from fastapi import FastAPI
import uvicorn
from mylib.logic import additon
from mylib.logic import subtraction


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "This is a Arithmetic API Microservice. Call add/x or sub/x"}


@app.get("/add/{x}")
async def add(x: int):
    """This is an arithmetic"""

    result = additon(x)
    return {"result": result}


@app.get("/sub/{x}")
async def sub(x: int):
    """This is an subtraction"""

    result = subtraction(x)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
