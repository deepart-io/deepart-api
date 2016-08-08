import requests
import urllib
import time
import sys

r = requests.post('http://turbo.deepart.io/api/post/',
                  data={'style': sys.argv[2],
                        'return_url': 'http://my.return/' },
                  files={ 'input_image': ( 'file.jpg', open(sys.argv[1], 'rb'), 'image/jpeg' ) } )
img=r.text
link=("http://turbo.deepart.io/media/output/%s.jpg" % img)
print link
time.sleep(1)
urllib.urlretrieve (link, "res.jpg")
