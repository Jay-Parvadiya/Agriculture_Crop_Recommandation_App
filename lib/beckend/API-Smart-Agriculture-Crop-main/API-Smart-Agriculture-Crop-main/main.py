from fastapi import FastAPI, HTTPException, Header
from pydantic import BaseModel
import numpy as np
import pickle

# Initialize FastAPI app
app = FastAPI()

# Load the ML model and scaler
model = pickle.load(open("model.pkl", "rb"))
scaler = pickle.load(open("minmaxscaler.pkl", "rb"))

# Static API Key (Store this securely in production)
API_KEY = "c9f8b4a0ff0c4c4dbd1a809e83d4c4a7"

# Request model for input validation
class CropRequest(BaseModel):
    Nitrogen: float
    Phosporus: float
    Potassium: float
    Temperature: float
    Humidity: float
    pH: float
    Rainfall: float

# Crop dictionary for predictions
crop_dict = {
    1: "Rice", 2: "Maize", 3: "Jute", 4: "Cotton", 5: "Coconut", 6: "Papaya",
    7: "Orange", 8: "Apple", 9: "Muskmelon", 10: "Watermelon", 11: "Grapes",
    12: "Mango", 13: "Banana", 14: "Pomegranate", 15: "Lentil", 16: "Blackgram",
    17: "Mungbean", 18: "Mothbeans", 19: "Pigeonpeas", 20: "Kidneybeans",
    21: "Chickpea", 22: "Coffee"
}

# Home endpoint
@app.get("/")
def read_root():
    return {"message": "Welcome to the Crop Recommendation API!"}

# Prediction endpoint
@app.post("/predict")
def predict_crop(request: CropRequest, x_api_key: str = Header(None)):
    # API key validation
    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Unauthorized. Invalid API key.")

    # Convert input to numpy array
    features = np.array([[request.Nitrogen, request.Phosporus, request.Potassium,
                          request.Temperature, request.Humidity, request.pH, request.Rainfall]])
    # Scale inputs
    scaled_features = scaler.transform(features)

    # Predict crop
    prediction = model.predict(scaled_features)
    result = crop_dict.get(prediction[0], "Unknown Crop")

    return {"crop": result}
