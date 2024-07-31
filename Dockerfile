## use the official python 3.9 image

FROM python:3.9

## set the working directory in the container   
WORKDIR /app

## copy the dependencies file to the working directory      
COPY ./requirements.txt /code/requirements.txt


## install dependencies
RUN pip install --no-cache-dir -r requirements.txt


## set up a new user named "user"
RUN useradd user

## change to the "user" user
USER user

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

#Set the working directory
WORKDIR $HOME/app

#Copy the current directory contents into the container at $HOME/app setting the owner 
COPY --chown=user:user . $HOME/app

## start the FastAPI app on port 7860
CMD ["uvicorn", "app:app", "--host", "0.0.0.0","--port", "7860"]



















