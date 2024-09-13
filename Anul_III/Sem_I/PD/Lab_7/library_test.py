#Sarcina 13 
from fimage import FImage
from fimage.filters import Contrast, Brightness, Saturation, Sepia


def saturatie():
    image = FImage('my_image.jpg')
    image.apply(
        Saturation(20),
        Contrast(25),
        Brightness(15)
    )
    image.save('my_picture_mixed.jpg')
    print(image)

def bl_wh():
    image = FImage('my_image.jpg')
    image.apply(Sepia(90))
    image.save('my_picture_sepia.jpg')

if __name__ == "__main__":
    saturatie()
    bl_wh()
    #6cvtyq
