class Resize
  def processed(params)
   task = Task.new params
   task.remote_image_url = params['image']
   task.save!

   image = MiniMagick::Image.open(task.image.file.file)
   image.resize params['params']
   image.rotate(90)
   image.format "jpeg"
   image.write task.image.file.file
   task
  end
end