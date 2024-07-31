"""
LLM + Hugging face Model + Deployment using Docker + deployment on Hugging face spaces

"""


from fastapi import FastAPI
from transformers import pipeline
import os

##create a new fastapi app
app=FastAPI()



#Initialize the text generation pipeline
# loading model from the hugging face model hub

pipe = pipeline("text2text-generation", model="google/flan-t5-small")


@app.get("/")
def home():
    return {"message":"Welcome to the Text Generation API"}



@app.get("/generate")
# '''text --> prompt'''

def generate(text:str):
    output = pipe(text, do_sample=True, temperature=0.7)

    #retuen the fgenerated text in json response
    return{"output":output[0]['generate']}
    











































