res=`curl \
  --form "style=$2" \
  --form "input_image=@$1" \
  --form "return_url=http://my.return/" \
  http://turbo.deepart.io/api/post/`
echo $res
link=http://turbo.deepart.io/media/output/$res.jpg
sleep 1
wget $link
