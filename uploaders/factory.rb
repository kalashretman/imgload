class Factory

  @@inst = Factory.new()
  def self.getInstance
   return @@inst
  end
  private_class_method :new

  def getObject (params)
   case params['task']
    when 'resize'
     Resize.new
    else
     raise "task not defined"
    end
  end
end