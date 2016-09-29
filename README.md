# deepart-api version 0.1 alpha

Download our repository
```bash
git clone https://github.com/deepart-io/deepart-api.git
```

## Bash example
```
cd bash
```

Now, for any image you want to convert just type
```
./submit.sh filepath style_id
```

where `style_id` is one of the styles listed here http://turbo.deepart.io/styles/ (in the format `style_id style_url`)

## Python example
```
cd python
```

Now, for any image you want to convert just type
```
python submit.py filepath style_id
```

where `style_id` is one of the styles listed here http://turbo.deepart.io/styles/ (in the format `style_id style_url`)

## API
### Authentication
Does not require any parameters for the moment. Returns the version
```
http://turbo.deepart.io/auth/
```
Returns:
```
0.1
```

### List of styles
```
http://turbo.deepart.io/styles/
```
Returns:
```
[id1] [image1] [title1]
[id2] [image2] [title2]
```

### Submit an image:
```
curl \
  --form "style=[style_id_here]" \
  --form "input_image=@[file_path_here]" \
  http://turbo.deepart.io/api/post/
```
Returns:
```
[image_id]
```

### Download the result:
```
http://turbo.deepart.io/media/output/[image_id].jpg
```
It may take around 1 second to have the image ready. For now let's just try to download it every 1 sec (and give up after 10 sec). In future there will be a push notification.
