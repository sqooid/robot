import cv2


def get_frame():
    cam = cv2.VideoCapture(0)
    ret, image = cam.read()
    cam.release()
    return image
