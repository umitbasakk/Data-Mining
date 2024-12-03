# YOLO
import torch
print(torch.cuda.is_available())  # True döndürmelidir
import sympy
print(sympy.__file__)
import sys
print(sys.path)

# Etiketlerin bulunduğu klasör yolu
import os
os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

from ultralytics import YOLO

# Load a model
model = YOLO("yolo11n.pt")

# Train the model
train_results = model.train(
    data="coco8.yaml",  # path to dataset YAML
    epochs=100,  # number of training epochs
    imgsz=640,  # training image size
    device="cuda",  # device to run on, i.e. device=0 or device=0,1,2,3 or device=cpu
)

# Evaluate model performance on the validation set
metrics = model.val()

# Perform object detection on an image
results = model("C:\YoloFoodDataset\BAKLAVA\images.jpg")
results[0].show()

# Export the model to ONNX format
path = model.export(format="onnx")  # return path to exported model

dataset = 'C:\\Notlarim\\Python_Projelerim\\Projelerim\\Yolo\\dataset'

#training
!yolo task = detect mode=train model= yolov8m.pt data={dataset}/data.yaml epochs = 20 imgsz = 14

#val 
!yolo task=detect mode=val model="C:/Notlarim/Python_Projelerim/Projelerim/Yolo/runs/detect/train/weights/best.pt" data="C:/Notlarim/Python_Projelerim/Projelerim/Yolo/dataset/data.yaml"

#predict
!yolo task = detect mode = predict model="C:/Notlarim/Python_Projelerim/Projelerim/Yolo/runs/detect/train3/weights/best.pt" data="C:/Notlarim/Python_Projelerim/Projelerim/Yolo/dataset/data.yaml"

#own test
!yolo task=detect mode=predict model="C:/Notlarim/Python_Projelerim/Projelerim/Yolo/runs/detect/train3/weights/best.pt" source="C:\YoloFoodDataset\BAKLAVA\fstkl_baklava.jpeg"


import glob
from IPython.display import Image, display

for image_path in glob.glob(f'/')


