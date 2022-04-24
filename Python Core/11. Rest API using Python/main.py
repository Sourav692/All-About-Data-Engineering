from fastapi import FastAPI

app = FastAPI()

@app.get("/sourav/{surname}")
def root(surname):
  return {f"Full Name Sourav {surname}"}


if __name__ == "__main__":
    root()
