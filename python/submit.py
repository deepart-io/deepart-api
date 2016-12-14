import requests
import urllib
import time
import sys
from PIL import Image

r = requests.post('http://turbo.deepart.io/api/post/',
                  data={'style': sys.argv[2],
                        'return_url': 'http://my.return/' },
                  files={ 'input_image': ( 'file.jpg', open(sys.argv[1], 'rb'), 'image/jpeg' ) } )
img=r.text
link=("http://turbo.deepart.io/media/output/%s.jpg" % img)
print link

max_num_seconds = 15

for i in range(max_num_seconds):

    time.sleep(1)
    urllib.urlretrieve (link, "res.jpg")
 
    try:
        img = Image.open("res.jpg")
        img.close()
        break

    except:
        print "Try #"+str(i+1)+": Retrieving image failed (deepart-api needs more time). Trying again after 1s."
