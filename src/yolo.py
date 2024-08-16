from super_gradients.training import models
from super_gradients.common.object_names import Models
import time

from camera import get_frame


if __name__ == "__main__":
    input("Enter to take picture")
    img = get_frame()
    print("Captured")
    ts = int(time.time())
    yolo = models.get(Models.YOLO_NAS_S, pretrained_weights="coco")
    model_predictions = yolo.predict(img).save(f"test/detect-{ts}.jpg")

    prediction = model_predictions[
        0
    ].prediction  # One prediction per image - Here we work with 1 image so we get the first.

    bboxes = (
        prediction.bboxes_xyxy
    )  # [[Xmin,Ymin,Xmax,Ymax],..] list of all annotation(s) for detected object(s)
    bboxes = (
        prediction.bboxes_xyxy
    )  # [[Xmin,Ymin,Xmax,Ymax],..] list of all annotation(s) for detected object(s)
    class_names = (
        prediction.class_names
    )  # ['Class1', 'Class2', ...] List of the class names
    class_name_indexes = prediction.labels.astype(
        int
    )  # [2, 3, 1, 1, 2, ....] Index of each detected object in class_names(corresponding to each bounding box)
    confidences = prediction.confidence.astype(
        float
    )  # [0.3, 0.1, 0.9, ...] Confidence value(s) in float for each bounding boxes
